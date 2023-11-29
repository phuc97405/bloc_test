import 'dart:io';

import 'package:bloc_test/core/base/model/auth_model.dart';
import 'package:bloc_test/core/base/model/login_model.dart';
import 'package:bloc_test/core/base/service/interface_auth_service.dart';
import 'package:bloc_test/core/constants/enums/network_enums.dart';

class AuthService extends IAuthService {
  AuthService(super.dioManager);

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
}
