import 'package:bloc_test/core/base/service/auth_service.dart';
import 'package:bloc_test/core/init/cache/auth_cache_manager.dart';
import 'package:dio/dio.dart';

class DioManager {
  static DioManager? _instance;

  static DioManager get instance {
    if (_instance != null) return _instance!;
    _instance = DioManager._init();
    return _instance!;
  }

  final String _baseUrl =
      'http://ec2-15-164-200-8.ap-northeast-2.compute.amazonaws.com:3000/api/v1/';
  //  'https://api-mildang.brickmate.kr/api/v1';
  late final Dio dio;
  late AuthService authService;
  late AuthCacheManager authCacheManager;

  DioManager._init() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        followRedirects: true,
      ),
    );
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (option, handler) async {
      option.headers['Accept'] = 'application/json';
      // String? token = _getStorage.read(GetStorageKey.accessToken);
      // option.headers['Authorization'] = 'Bearer $token';
      return handler.next(option);
    }, onError: (error, handle) async {
      if (error.response?.statusCode == 401) {
        //token is authorized
        final newAccessToken = await authService.refreshToken();
        if (newAccessToken != null) {
          dio.options.headers['Authorization'] = 'Bearer $newAccessToken';
        }
      }
      return handle.next(error);
    }));
  }
}
