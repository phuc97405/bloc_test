import 'dart:io';

import 'package:bloc_test/core/base/model/auth_model.dart';
import 'package:bloc_test/core/base/model/login_model.dart';
import 'package:bloc_test/core/base/service/interface_auth_service.dart';
import 'package:bloc_test/core/constants/enums/network_enums.dart';
import 'package:bloc_test/core/init/cache/auth_cache_manager.dart';
import 'package:bloc_test/core/init/cache/cache_manager.dart';

class AuthService extends IAuthService {
  AuthService(super.dioManager);
  late AuthCacheManager authCacheManager;
  @override
  Future<String?> login({
    required String phone,
    required String password,
  }) async {
    var response = await dioManager.dio.post(
      NetworkEnums.login.path,
      data: LoginModel(
        phone: phone,
        password: password,
      ).toJson(),
    );
    print('response: $response');

    if (response.statusCode == HttpStatus.ok) {
      return ResponseUser.fromJson(response.data).data.token.accessToken;
    } else {
      return throw Exception();
    }
  }

  Future<String?> refreshToken() async {
    try {
      if (await CacheManager.containsKey(NetworkEnums.token.path)) {
        final refreshToken =
            await CacheManager.getString(NetworkEnums.token.path);

        if (refreshToken != null) {
          final response = await dioManager.dio.post('/authentication/refresh',
              data: {'refreshToken': refreshToken});
          final newAccessToken =
              ResponseUser.fromJson(response.data).data.token.accessToken;
          await authCacheManager.updateToken(newAccessToken);
        }
      }
    } catch (exception) {
      authCacheManager.signOut();
      //Get.offAllNamed(Routes.login);
    }
    return null;
  }
}