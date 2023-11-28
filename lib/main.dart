import 'package:bloc_test/bloc/authen_bloc.dart';
import 'package:bloc_test/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_test/bloc/color_bloc/color_bloc.dart';
import 'package:bloc_test/modules/home/home.dart';
import 'package:bloc_test/modules/login/login_screen.dart';
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
          BlocProvider<CounterBloc>(
            create: (context) => CounterBloc(),
          ),
          BlocProvider<ColorBloc>(
            create: (context) => ColorBloc(),
          ),
          // BlocProvider<AuthBloc>(create: (context) => AuthBloc())
        ],
            child: MaterialApp(
              title: 'Flutter Demo',
              initialRoute: '/',
              routes: {
                '/': (context) => const LoginScreen(),
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
