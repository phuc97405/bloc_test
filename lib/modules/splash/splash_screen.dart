import 'dart:async';

import 'package:bloc_test/bloc/authen_bloc.dart';
import 'package:bloc_test/bloc/authen_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AuthBloc authBloc;
  late StreamSubscription authStream;

  @override
  void initState() {
    super.initState();
    authBloc = context.read<AuthBloc>()..add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Text('splash screen');
  }
}
