import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants? _instance;
  static ColorConstants get instance {
    _instance ??= ColorConstants._init();
    return _instance!;
  }

  ColorConstants._init();

  Color black = const Color(0xFF252525);
  Color primary = const Color(0xffCADEAF);
  Color onPrimary = const Color(0xff628941);
  Color teal = const Color(0xff37A492);
}
