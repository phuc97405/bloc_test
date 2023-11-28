import 'package:bloc_test/service/provider/api_provider.dart';

abstract class IAuthService {
  final MyApiProvider myApiProvider;

  IAuthService(this.myApiProvider);

  Future<String?> login({
    required String email,
    required String password,
  });
}
