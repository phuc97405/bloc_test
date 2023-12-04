import 'package:bloc_test/core/base/service/auth_service.dart';
import 'package:bloc_test/core/init/cache/auth_cache_manager.dart';
import 'package:bloc_test/core/init/network/dio_manager.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupLocator() {
  getIt.registerSingleton<DioManager>(DioManager.instance);
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<AuthCacheManager>(const AuthCacheManager());
  getIt.registerSingleton<AuthService>(AuthService()); //public

  // GetIt.I.registerSingleton<AppModel>(AppModel());//don't public
}
