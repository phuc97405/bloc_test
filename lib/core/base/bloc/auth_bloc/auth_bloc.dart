import 'dart:developer';
import 'dart:io';

import 'package:bloc_test/core/base/model/auth_model.dart';
import 'package:bloc_test/core/base/service/auth_service.dart';
import 'package:bloc_test/core/init/cache/auth_cache_manager.dart';
import 'package:bloc_test/locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/enums/auth_enums.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.unknown()) {
    final authCacheManager = getIt<AuthCacheManager>();

    on<AppStarted>((event, emit) async {
      try {
        if (await authCacheManager.isLoggedIn()) {
          await authCacheManager.updateTokenFromStorage();
          emit(const AuthState.authenticated());
        } else {
          // emit((await authCacheManager.isFirstEntry())``
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
        final Token? response = await getIt<AuthService>()
            .login(phone: event.phone, password: event.password);
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
