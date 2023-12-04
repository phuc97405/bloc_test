import 'package:bloc_test/core/base/model/auth_model.dart';

abstract class IAuthService {
  Future<Token?> login({
    required String phone,
    required String password,
  });
}
