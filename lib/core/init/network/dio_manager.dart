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

  DioManager._init() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        followRedirects: true,
      ),
    );
  }
}
