import 'package:bloc_test/core/constants/enums/auth_enums.dart';
import 'package:bloc_test/view/auth/login_view.dart';
import 'package:bloc_test/view/home/home_view.dart';
import 'package:flutter/material.dart';

extension NavigateExtension on AuthStatus {
  Widget get firstView {
    switch (this) {
      case AuthStatus.authenticated:
        return const HomeView();
      case AuthStatus.guest:
        return const LoginView();
      case AuthStatus.unknown:

        /// MARK: It can be IntroView.

        break;
    }
    return const LoginView();
  }
}
