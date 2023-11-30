import 'dart:developer';
import 'dart:io';

import 'package:bloc_test/core/base/model/auth_model.dart';
import 'package:bloc_test/core/init/cache/auth_cache_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/enums/auth_enums.dart';
import '../../service/interface_auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthService authService;
  final AuthCacheManager authCacheManager;

  AuthBloc(this.authService, this.authCacheManager)
      : super(const AuthState.unknown()) {
    on<AppStarted>((event, emit) async {
      try {
        if (await authCacheManager.isLoggedIn()) {
          print('authen');
          await authCacheManager.updateTokenFromStorage();
          emit(const AuthState.authenticated());
        } else {
          print('guest');
          // emit((await authCacheManager.isFirstEntry())
          //     ? const AuthState.firstEntry()
          emit(const AuthState.guest());
        }
      } on SocketException {
        emit(const AuthState.error(error: AuthError.hostUnreachable));
      } catch (e) {
        log(e.toString());
        emit(const AuthState.error());
      }
    });

    on<LoginRequested>(
      (event, emit) async {
        final Token? response = await authService.login(
            phone: event.phone, password: event.password);
        print('response token: $response');
        if (response != null) {
          await authCacheManager.updateToken(response);
          await authCacheManager.updateLoggedIn(true);
          emit(const AuthState.authenticated());
        } else {
          add(LogoutRequested());
          emit(const AuthState.error(error: AuthError.wrongEmailOrPassword));
        }
      },
    );

    on<LogoutRequested>((event, emit) async {
      try {
        await authCacheManager.signOut();
        emit(const AuthState.guest());
      } catch (_) {
        print(_);
      }
    });
  }
}