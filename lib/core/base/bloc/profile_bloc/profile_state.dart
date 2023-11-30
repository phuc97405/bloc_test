part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final Data? profileData;
  const ProfileState._({this.profileData});

  const ProfileState.initial() : this._();
  const ProfileState.setProfileData(Data data) : this._(profileData: data);

  @override
  List<Object> get props => [];
}
