import 'dart:convert';

ReqLoginModel reqLoginModelFromJson(String str) =>
    ReqLoginModel.fromJson(json.decode(str));

String reqLoginModelToJson(ReqLoginModel data) => json.encode(data.toJson());

class ReqLoginModel {
  String phone;
  String password;

  ReqLoginModel({
    required this.phone,
    required this.password,
  });

  factory ReqLoginModel.fromJson(Map<String, dynamic> json) => ReqLoginModel(
        phone: json["phone"],
        password: json["password"],
      );
  Map<String, dynamic> toJson() => {
        "phone": phone,
        "password": password,
      };
}
