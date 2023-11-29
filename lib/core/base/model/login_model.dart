class LoginModel {
  String? phone;
  String? password;

  LoginModel({
    this.phone,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
    };
  }
}
