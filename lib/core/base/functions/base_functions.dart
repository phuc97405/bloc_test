import 'dart:io';

import 'package:bloc_test/core/constants/app/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseFunctions {
  static BaseFunctions? _instance;
  static BaseFunctions get instance {
    _instance ??= BaseFunctions._init();
    return _instance!;
  }

  BaseFunctions._init();

  Widget platformIndicator() {
    return Center(
      child: Platform.isIOS
          ? const CupertinoActivityIndicator()
          : CircularProgressIndicator(
              color: ColorConstants.instance.onPrimary,
            ),
    );
  }

  IconButton platformBackButton({
    required VoidCallback onPressed,
    Color? color = Colors.black,
  }) {
    return Platform.isIOS
        ? IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.arrow_back_ios,
              color: color,
            ),
          )
        : IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.arrow_back,
              color: color,
            ),
          );
  }
}
