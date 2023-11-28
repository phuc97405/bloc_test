import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_test/bloc/authen_event.dart';
import 'package:bloc_test/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
part 'authen_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthService authService;

  AuthBloc(this.authService) : super(const AuthState.unknown()) {
    on<AuthEvent>((event, emit) async {
      try {
        if (await authService.isLoggedln()) {
          await authService.updateTokenFromStorage();
          emit(const AuthState.authenticated());
        } else {
          emit((await authService.isFirstEntry())
              ? const AuthState.firstEntry()
              : AuthState.guest());
        }
      } on SocketException {
        emit(const AuthState.error(error: AuthError.hostUnreachable));
      } catch (e) {
        emit(const AuthState.error());
      }
    });

//     on((event, emit) async {

// final response=await authService.login(phone: event.phone, password: event.password);
// if(response.token!=null)

//     })
  }
}

// Future<void> handleEvent(AuthenEvent event, Emitter<AuthenState> emit) {
//   if (event is AuthenChangeEvent) {}
// }

// Future<void> onInit(Emitter<AuthState> emit) async {}

// Future<void> _onAuthChangeState() {}
