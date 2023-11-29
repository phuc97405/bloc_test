import 'package:bloc_test/core/base/model/auth_model.dart';

import '../../init/network/dio_manager.dart';

abstract class IAuthService {
  final DioManager dioManager;

  IAuthService(this.dioManager);

  Future<Token?> login({
    required String phone,
    required String password,
  });
}
