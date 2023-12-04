import 'dart:async';

import 'package:bloc_test/core/base/model/profile_model.dart';
import 'package:bloc_test/core/base/service/interface_profile_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IProfileService profileService;

  ProfileBloc(
    this.profileService,
  ) : super(ProfileInitial()) {
    print('profile initial fetch');
    on<ProfileInitialFetchEvent>(profileInitialFetchEvent);
    on<ProfileUpdateEvent>(profileUpdateEvent);
  }

  FutureOr<void> profileInitialFetchEvent(
      ProfileInitialFetchEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileFetchingLoadingState());
    try {
      // await authCacheManager.updateTokenFromStorage();
      final response = await profileService.getProfile();
      // print('profile: ${jsonEncode(response)}');
      emit(ProfileFetchingSuccessFulState(profiles: response!));
    } catch (e) {
      emit(ProfileFetchingErrorState());
      print(e);
    }
  }

  FutureOr<void> profileUpdateEvent(
      ProfileUpdateEvent event, Emitter<ProfileState> emit) async {
    print('update profile');
    emit(ProfileFetchingLoadingState());
    try {
      final response = await profileService.updateProfile(
          nickname: event.nickname, email: event.email);
      // print('update: ${jsonEncode(response)}');
      emit(ProfileFetchingSuccessFulState(profiles: response!));
    } catch (e) {
      emit(ProfileFetchingErrorState());
      print(e);
    }
  }
}
