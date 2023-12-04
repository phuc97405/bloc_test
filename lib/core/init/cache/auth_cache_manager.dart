import 'package:bloc_test/core/base/model/auth_model.dart';
import 'package:bloc_test/locator.dart';

import '../../constants/enums/network_enums.dart';
import '../network/dio_manager.dart';
import 'cache_manager.dart';

class AuthCacheManager {
  const AuthCacheManager();
  // Future<bool> isFirstEntry() async {
  //   return !(await CacheManager.getBool(NetworkEnums.introOff.path) ?? false);
  // }

  Future<bool> isLoggedIn() async {
    return (await CacheManager.getBool(NetworkEnums.login.path)) ?? false;
  }

  Future<void> signOut() async {
    await CacheManager.clearAll();
  }

  // Future<void> updateFirstEntry() async {
  //   await CacheManager.setBool(NetworkEnums.introOff.path, true);
  // }

  Future<void> updateLoggedIn(bool isLoggedIn) async {
    await CacheManager.setBool(NetworkEnums.login.path, isLoggedIn);
  }

  Future<void> updateToken(Token? token) async {
    if (token != null) {
      await CacheManager.setString(NetworkEnums.token.path, tokenToJson(token));
      DioManager.instance.dio.options
          .headers[(MapEntry('Authorization', 'token ${token.accessToken}'))];

      /// Actually, we will not need it for this application.
      /// But I've included it here for instructive purposes.
    } else {
      if (await CacheManager.containsKey(NetworkEnums.token.path)) {
        await CacheManager.remove(NetworkEnums.token.path);
        DioManager.instance.dio.options.headers.clear();
      }
    }
  }

  Future<void> updateTokenFromStorage() async {
    if (await CacheManager.containsKey(NetworkEnums.token.path)) {
      final token = await CacheManager.getString(NetworkEnums.token.path);
      final Token tokenParse = tokenFromJson(token!);
      if (token.isNotEmpty) {
        print(tokenParse.accessToken);
        getIt<DioManager>().dio.options.headers[
            (MapEntry('Authorization', 'token ${tokenParse.accessToken}'))];

        /// Actually, we will not need it for this application.
        /// But I've included it here for instructive purposes.
      }
    }
  }
}
