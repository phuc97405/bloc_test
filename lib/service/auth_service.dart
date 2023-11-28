import 'package:bloc_test/models/User.dart';
import 'package:bloc_test/service/interface_auth_service.dart';
import 'package:bloc_test/service/model/req_login_model.dart';
import 'package:bloc_test/service/provider/api_provider.dart';

class AuthService extends IAuthService {
  // final dioManager;

  // IAuthService(this.dioManager);

  // final MyApiProvider myApiProvider;
  AuthService(super.myApiProvider);

  // Future<void> login({
  //   required String email,
  //   required String password,
  // }) async {
  // var res= dio.post
  Future<User> loginAPi(ReqLoginModel param) async {
    final res = await myApiProvider.post<User, ReqLoginModel>(
        '/authentication/login', param);
    // print('User$res');
    return userFromJson(res.toString());
    // }
  }

  Future<void> signOut() async {}
  Future<bool> isFirstEntry() async {
    return false;
  }

  Future<void> updateLoggedIn(bool isLoggedIn) async {}
  Future<void> updateTokenFromStorage() async {}
  Future<bool> isLoggedIn() async {
    return false;
  }

  Future<void> updateToken(String? token) async {
    if (token != null) {
      //update token to dio
    }
  }

  @override
  Future<String?> login(
      {required String email, required String password}) async {
    final res = await myApiProvider.post<User, ReqLoginModel>(
        '/authentication/login',
        ReqLoginModel(phone: email, password: password));
    // print('User$res');
    return (res.toString());
  }
}
