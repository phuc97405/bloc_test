part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  // final Data? profileData;
  // const ProfileState._({this.profileData});

  // const ProfileState.initial() : this._();

  // const ProfileState.getProfileData(Data data) : this._(profileData: data);

  @override
  List<Object> get props => [];
}

abstract class ProfileActionState extends ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileFetchingLoadingState extends ProfileState {}

class ProfileFetchingErrorState extends ProfileState {}

class ProfileFetchingSuccessFulState extends ProfileState {
  final Data profiles;
  ProfileFetchingSuccessFulState({required this.profiles});
}

// class ProfileUpdateSuccessState extends ProfileActionState {}

// class ProfileUpdateErrorState extends ProfileActionState {}
