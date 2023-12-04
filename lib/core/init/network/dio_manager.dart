import 'package:bloc_test/core/base/model/auth_model.dart';
import 'package:bloc_test/core/base/service/interface_auth_service.dart';
import 'package:bloc_test/core/constants/enums/network_enums.dart';
import 'package:bloc_test/core/init/cache/auth_cache_manager.dart';
import 'package:bloc_test/core/init/cache/cache_manager.dart';
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
  late IAuthService authService;
  late AuthCacheManager authCacheManager;

  DioManager._init() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        followRedirects: true,
        contentType: 'application/json',
      ),
    );
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (option, handler) async {
      if (await CacheManager.containsKey(NetworkEnums.token.path)) {
        final token = await CacheManager.getString(NetworkEnums.token.path);
        final Token tokenParse = tokenFromJson(token!);
        option.headers['Accept'] = 'application/json';
        option.headers['Authorization'] = 'Bearer ${tokenParse.accessToken}';
      }
      return handler.next(option);
    }, onError: (error, handle) async {
      if (error.response?.statusCode == 401) {
        //token is authorized
        final newAccessToken = await refreshToken();
        if (newAccessToken != null) {
          dio.options.headers['Authorization'] = 'Bearer $newAccessToken';
          return handle.resolve(await dio.fetch(error.requestOptions));
        }
      }
      return handle.next(error);
    }));
  }

  Future<String?> refreshToken() async {
    try {
      final token = await CacheManager.getString(NetworkEnums.token.path);
      final Token tokenParse = tokenFromJson(token!);
      if (token.isNotEmpty) {
        dio.options.headers['Authorization'] =
            'Bearer ${tokenParse.refreshToken}';
        final response = await dio.get(
          'authentication/refresh',
        );
        final newAccessToken = response.data['data']['accessToken'];
        print('newAccessToken$newAccessToken');
        return newAccessToken;
      }
    } catch (exception) {
      authCacheManager.signOut();
      //Get.offAllNamed(Routes.login);
    }
    return null;
  }
}
