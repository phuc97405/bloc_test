import 'dart:convert';

ProfileUser profileUserFromJson(String str) =>
    ProfileUser.fromJson(json.decode(str));

String profileUserToJson(ProfileUser data) => json.encode(data.toJson());

class ProfileUser {
  bool status;
  String message;
  Data data;

  ProfileUser({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProfileUser.fromJson(Map<String, dynamic> json) => ProfileUser(
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
  List<Category> categories;

  Data({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.username,
    required this.phone,
    required this.birthday,
    required this.gender,
    required this.nickname,
    required this.name,
    required this.email,
    required this.snsId,
    required this.accType,
    required this.role,
    required this.isActive,
    required this.loggedIn,
    required this.isDiabetes,
    required this.diabetesType,
    required this.firstLoginStage,
    required this.lastLoginAt,
    required this.deadActiveAt,
    required this.ads,
    required this.receiveAnnoucement,
    required this.receiveEvent,
    required this.receiveNewLetter,
    required this.receiveOnlineDoctor,
    required this.receiveReminder,
    required this.reminderMobileData,
    required this.bannerClick,
    required this.showPopup,
    required this.categories,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
        "username": username,
        "phone": phone,
        "birthday":
            "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
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
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  DateTime createdAt;
  DateTime updatedAt;
  int id;
  String name;
  String image;
  bool isActive;
  int userCount;

  Category({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.name,
    required this.image,
    required this.isActive,
    required this.userCount,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
        name: json["name"],
        image: json["image"],
        isActive: json["isActive"],
        userCount: json["userCount"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
        "name": name,
        "image": image,
        "isActive": isActive,
        "userCount": userCount,
      };
}
