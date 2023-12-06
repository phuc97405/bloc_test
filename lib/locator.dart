import 'package:bloc_test/core/base/service/auth_service.dart';
import 'package:bloc_test/core/base/service/profile_service.dart';
import 'package:bloc_test/core/constants/app/color_constants.dart';
import 'package:bloc_test/core/init/cache/auth_cache_manager.dart';
import 'package:bloc_test/core/init/network/dio_manager.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupLocator() {
  //only once instance is initialized
  getIt.registerSingleton<DioManager>(DioManager.instance);
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<AuthCacheManager>(const AuthCacheManager());
  getIt.registerSingleton<ColorConstants>(ColorConstants.instance);

//instance new when call
  getIt.registerFactory<AuthService>(() => AuthService());
  getIt.registerFactory<ProfileService>(() => ProfileService());
}
