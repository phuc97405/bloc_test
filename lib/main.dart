import 'dart:io';

import 'package:bloc_test/core/base/bloc/auth_bloc/auth_bloc.dart';
import 'package:bloc_test/core/base/service/auth_service.dart';
import 'package:bloc_test/core/constants/app/string_constants.dart';
import 'package:bloc_test/core/init/cache/auth_cache_manager.dart';
import 'package:bloc_test/core/init/network/dio_manager.dart';

import 'view/auth/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // HttpOverrides.global = MyHttpOverrides();
  runApp(
    BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(
        AuthService(DioManager.instance),
        AuthCacheManager(),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstants.appName,
      home: SplashView(),
    );
  }
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
