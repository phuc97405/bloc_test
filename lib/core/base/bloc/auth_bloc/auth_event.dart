part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthEvent {}

class LoginRequested extends AuthEvent {
  final String phone;
  final String password;

  const LoginRequested(this.phone, this.password);

  @override
  List<Object?> get props => [phone, password];
}

class LogoutRequested extends AuthEvent {}
