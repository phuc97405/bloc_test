import 'package:bloc_test/bloc/authen_bloc.dart';
import 'package:bloc_test/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_test/bloc/color_bloc/color_bloc.dart';
import 'package:bloc_test/modules/home/home.dart';
import 'package:bloc_test/modules/login/login_screen.dart';
import 'package:bloc_test/modules/splash/splash_screen.dart';
import 'package:bloc_test/service/auth_service.dart';
import 'package:bloc_test/service/interface_auth_service.dart';
import 'package:bloc_test/service/provider/api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final MyApiProvider apiProvider;

    return
        // BlocProvider<CounterBloc>(
        //   create: (context) => CounterBloc(),
        //   child: BlocProvider<ColorBloc>(
        //     create: (context) => ColorBloc(),
        //     child: MaterialApp(
        //       initialRoute: '/',
        //       routes: {
        //         '/': (context) => const LoginScreen(),
        //         '/home': (context) =>
        //             const MyHomePage(title: 'Flutter Demo Home Page')
        //       },
        //       theme: ThemeData(
        //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //         useMaterial3: true,
        //       ),
        //     ),
        //   ),
        // );
        MultiBlocProvider(
            providers: [
          // BlocProvider<CounterBloc>(
          //   create: (context) => CounterBloc(),
          // ),
          // BlocProvider<ColorBloc>(
          //   create: (context) => ColorBloc(),
          // ),
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(IAuthService(MyApiProvider())),
          )
        ],
            child: MaterialApp(
              title: 'Flutter Demo',
              initialRoute: '/splash',
              routes: {
                '/': (context) => const LoginScreen(),
                '/splash': (context) => const SplashScreen(),
                '/home': (context) =>
                    const MyHomePage(title: 'Flutter Demo Home Page')
              },
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
            ));
  }
}
