// To parse this JSON data, do
//
//     final resRefreshToken = resRefreshTokenFromJson(jsonString);

import 'dart:convert';

ResRefreshToken resRefreshTokenFromJson(String str) =>
    ResRefreshToken.fromJson(json.decode(str));

String resRefreshTokenToJson(ResRefreshToken data) =>
    json.encode(data.toJson());

class ResRefreshToken {
  bool status;
  String message;
  Data data;

  ResRefreshToken({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ResRefreshToken.fromJson(Map<String, dynamic> json) =>
      ResRefreshToken(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String user;
  String accessToken;

  Data({
    required this.user,
    required this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: (json["user"]),
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "accessToken": accessToken,
      };
}
