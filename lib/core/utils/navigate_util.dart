import 'package:flutter/material.dart';

class NavigateUtil {
  NavigateUtil._();

  static void navigateToView(BuildContext context, Widget route,
      {Object? arguments}) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => route,
          settings: RouteSettings(arguments: arguments)),
    );
  }

  static void navigateToNamed(BuildContext context, String routeName,
      {Object? arguments}) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void navigatePop(
    BuildContext context,
  ) {
    Navigator.pop(context);
  }

  static void navigatePopWithResult(BuildContext context, dynamic result) {
    Navigator.pop(context, result);
  }

  static void navigatePopUntil(BuildContext context, String routeName) {
    Navigator.popUntil(context, ModalRoute.withName(routeName));
  }

  static void navigateReplacementNamed(
      BuildContext context, String routeName, //login
      {Object? arguments}) {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  static void navigatePushNamedAndRemoveUntil(
      //logout
      BuildContext context,
      String newRouteName,
      {Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(context, newRouteName, (route) => false,
        arguments: arguments);
  }
}
