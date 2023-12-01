part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

// class SetProfileData extends ProfileEvent {}

class ProfileInitialFetchEvent extends ProfileEvent {}

class ProfileUpdateEvent extends ProfileEvent {
  final String nickname;
  final String email;

  const ProfileUpdateEvent(this.nickname, this.email);
}
