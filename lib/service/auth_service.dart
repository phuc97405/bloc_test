abstract class IAuthService {
  final dioManager;

  IAuthService(this.dioManager);

  Future<void> login({
    required String phone,
    required String password,
  });

  Future<void> signOut();
  Future<bool> isFirstEntry();
  Future<void> updateLoggedln(bool isLoggedln);
  Future<void> updateTokenFromStorage();
  Future<bool> isLoggedln();
  Future<void> updateToken(String? token);
}
