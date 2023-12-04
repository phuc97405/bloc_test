import 'dart:convert';
import 'dart:io';

import 'package:bloc_test/core/base/model/auth_model.dart';
import 'package:bloc_test/core/base/model/login_model.dart';
import 'package:bloc_test/core/base/service/interface_auth_service.dart';
import 'package:bloc_test/core/constants/enums/network_enums.dart';
import 'package:bloc_test/core/init/network/dio_manager.dart';
import 'package:bloc_test/locator.dart';

class AuthService extends IAuthService {
  @override
  Future<Token?> login({
    required String phone,
    required String password,
  }) async {
    var response = await getIt<DioManager>().dio.post(
          NetworkEnums.login.path,
          data: LoginModel(
            phone: phone,
            password: password,
          ).toJson(),
        );
    print('response: $response');

    if (response.statusCode == HttpStatus.ok) {
      return ResponseUser.fromJson(response.data).data.token;
    } else {
      return throw Exception();
    }
  }

  Future<String?> getProfile() async {
    var response = await getIt<DioManager>().dio.get(
          'user',
        );
    print('response: $response');
    if (response.statusCode == HttpStatus.ok) {
      return jsonEncode(response.data);
    } else {
      return throw Exception();
    }
  }
}
