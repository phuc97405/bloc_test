part of 'authen_bloc.dart';

enum AuthStatus { authenticated, unauthenticated, unknown }

enum AuthError { hostUnreachable, unknown, wrongEmailOrPassword }

class AuthState {
  final AuthStatus status;
  final bool isFirstEntry;
  final AuthError? error;

  const AuthState._(
      {this.status = AuthStatus.unknown, this.isFirstEntry = true, this.error});

  const AuthState.unknown() : this._();

  const AuthState.authenticated()
      : this._(
          status: AuthStatus.authenticated,
        );

  const AuthState.firstEntry() : this._();
  const AuthState.guest() : this._();

  const AuthState.error({AuthError? error})
      : this._(error: AuthError.wrongEmailOrPassword);
// final class AuthInitial extends AuthState {
//   AuthInitial() : super(status: AuthStatus.unauthenticated);
// }

// class AuthChangeState extends AuthState {
//   AuthChangeState(AuthStatus value) : super(status: value);
// }

// class SetAccessToken extends AuthState {
//   SetAccessToken(String token)
//       : super(
//           status: AuthStatus.authenticated,
//         );
// }
}
