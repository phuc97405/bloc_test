import 'dart:ui';

import 'package:bloc_test/core/constants/app/color_constants.dart';
import 'package:bloc_test/core/constants/app/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight? get instance {
    _instance ??= TextThemeLight._init();
    return _instance;
  }

  TextThemeLight._init();

  final TextStyle headline1 = TextStyle(
    fontSize: 17.sp,
    fontFamily: StringConstants.fontFamily,
    color: ColorConstants.black,
  );

  final TextStyle headline2 = TextStyle(
    fontSize: 18.sp,
    fontFamily: StringConstants.fontFamily,
    color: ColorConstants.black,
  );

  final TextStyle subtitle1 = TextStyle(
    fontSize: 11.sp,
    fontFamily: StringConstants.fontFamily,
    color: ColorConstants.black,
  );

  final TextStyle subtitle2 = TextStyle(
    fontSize: 15.sp,
    fontFamily: StringConstants.fontFamily,
    color: ColorConstants.black,
  );

  final TextStyle button = TextStyle(
    fontSize: 17.sp,
    color: Colors.white,
  );
}
