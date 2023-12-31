import 'package:flutter/material.dart';

@immutable
class StringConstants {
  const StringConstants._();

  static const String appName = 'BusApp';
  static const String fontFamily = '';

  /// for Login view
  static const String loginTitle = "You can log in with your information.";
  static const String loginButtonText = "LOGIN";
  static const String updateButtonText = "UPDATE";
  static const String phoneTitle = "Phone";
  static const String passwordTitle = "Password";
  static const String birthTitle = "BirthDay";
  static const String nicknameTitle = "Nickname";
  static const String emailTitle = "Email";

  static const String phoneHint = '084 xxxx xxxx';
  static const String passwordHint = '···········';
  static const String birthHint = 'xxxxxx/x';
  static const String nicknameHint = 'pista';

  static const String emailHint = 'example@gmail.com';

  /// for Home view
  static const String homePage = 'Home Page';

  /// for validators
  static const String requiredField = "Required field";
  static const String makeSureCorrectMail =
      "Please make sure you enter the correct email.";
}
