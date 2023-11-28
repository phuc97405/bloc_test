import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:bloc_test/bloc/authen_event.dart';
import 'package:bloc_test/service/interface_auth_service.dart';
part 'authen_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthService authService;
  final 

  AuthBloc(this.authService) : super(const AuthState.unknown()) {
    on<AppStarted>((event, emit) async {
      try {
        if (await authService.isLoggedIn()) {
          await authService.updateTokenFromStorage();
          emit(const AuthState.authenticated());
        } else {
          emit((await authService.isFirstEntry())
              ? const AuthState.firstEntry()
              : const AuthState.guest());
        }
      } on SocketException {
        emit(const AuthState.error(error: AuthError.hostUnreachable));
      } catch (e) {
        log(e.toString());
        emit(const AuthState.error());
      }
    });
    on<LoginRequested>((event, emit) async {
      // final response =
      //     await authService.login(email: event.email, password: event.password);
      // if (response.token != null) {
      //   log(response.token!);
      //   await authService.updateToken(response.token);
      //   await authService.updateLoggedIn(true);
      //   emit(const AuthState.authenticated());
      // } else {
      //   add(LogoutRequested());
      //   emit(const AuthState.error(error: AuthError.wrongEmailOrPassword));
      // }
    });
    on<LogoutRequested>((event, emit) async {
      try {
        await authService.signOut();
        emit(const AuthState.guest());
      } catch (e) {
        log(e.toString());
      }
    });
  }
}

// Future<void> handleEvent(AuthenEvent event, Emitter<AuthenState> emit) {
//   if (event is AuthenChangeEvent) {}
// }

// Future<void> onInit(Emitter<AuthState> emit) async {}

// Future<void> _onAuthChangeState() {}
