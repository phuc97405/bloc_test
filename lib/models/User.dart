import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
Data dataUserFromJson(String str) => Data.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  bool status;
  String message;
  Data data;

  User({
    required this.status,
    required this.message,
    required this.data,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
  UserClass user;
  Token token;

  Data({
    required this.user,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: UserClass.fromJson(json["user"]),
        token: Token.fromJson(json["token"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token.toJson(),
      };
}

class Token {
  String accessToken;
  String refreshToken;

  Token({
    required this.accessToken,
    required this.refreshToken,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}

class UserClass {
  DateTime createdAt;
  DateTime updatedAt;
  int id;
  dynamic username;
  String phone;
  DateTime birthday;
  int gender;
  String nickname;
  dynamic name;
  dynamic email;
  dynamic snsId;
  String accType;
  String role;
  bool isActive;
  bool loggedIn;
  bool isDiabetes;
  String diabetesType;
  int firstLoginStage;
  DateTime lastLoginAt;
  dynamic deadActiveAt;
  bool ads;
  bool receiveAnnoucement;
  bool receiveEvent;
  bool receiveNewLetter;
  bool receiveOnlineDoctor;
  bool receiveReminder;
  String reminderMobileData;
  int bannerClick;
  bool showPopup;

  UserClass({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    this.username,
    required this.phone,
    required this.birthday,
    required this.gender,
    required this.nickname,
    this.name,
    this.email,
    this.snsId,
    required this.accType,
    required this.role,
    required this.isActive,
    required this.loggedIn,
    required this.isDiabetes,
    required this.diabetesType,
    required this.firstLoginStage,
    required this.lastLoginAt,
    this.deadActiveAt,
    required this.ads,
    required this.receiveAnnoucement,
    required this.receiveEvent,
    required this.receiveNewLetter,
    required this.receiveOnlineDoctor,
    required this.receiveReminder,
    required this.reminderMobileData,
    required this.bannerClick,
    required this.showPopup,
  });

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
        username: json["username"],
        phone: json["phone"],
        birthday: DateTime.parse(json["birthday"]),
        gender: json["gender"],
        nickname: json["nickname"],
        name: json["name"],
        email: json["email"],
        snsId: json["snsId"],
        accType: json["accType"],
        role: json["role"],
        isActive: json["isActive"],
        loggedIn: json["loggedIn"],
        isDiabetes: json["isDiabetes"],
        diabetesType: json["diabetesType"],
        firstLoginStage: json["firstLoginStage"],
        lastLoginAt: DateTime.parse(json["lastLoginAt"]),
        deadActiveAt: json["deadActiveAt"],
        ads: json["ads"],
        receiveAnnoucement: json["receiveAnnoucement"],
        receiveEvent: json["receiveEvent"],
        receiveNewLetter: json["receiveNewLetter"],
        receiveOnlineDoctor: json["receiveOnlineDoctor"],
        receiveReminder: json["receiveReminder"],
        reminderMobileData: json["reminderMobileData"],
        bannerClick: json["bannerClick"],
        showPopup: json["showPopup"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
        "username": username,
        "phone": phone,
        "birthday": birthday.toIso8601String(),
        "gender": gender,
        "nickname": nickname,
        "name": name,
        "email": email,
        "snsId": snsId,
        "accType": accType,
        "role": role,
        "isActive": isActive,
        "loggedIn": loggedIn,
        "isDiabetes": isDiabetes,
        "diabetesType": diabetesType,
        "firstLoginStage": firstLoginStage,
        "lastLoginAt": lastLoginAt.toIso8601String(),
        "deadActiveAt": deadActiveAt,
        "ads": ads,
        "receiveAnnoucement": receiveAnnoucement,
        "receiveEvent": receiveEvent,
        "receiveNewLetter": receiveNewLetter,
        "receiveOnlineDoctor": receiveOnlineDoctor,
        "receiveReminder": receiveReminder,
        "reminderMobileData": reminderMobileData,
        "bannerClick": bannerClick,
        "showPopup": showPopup,
      };
}
