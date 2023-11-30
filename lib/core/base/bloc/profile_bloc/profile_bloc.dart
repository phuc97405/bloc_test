import 'package:bloc/bloc.dart';
import 'package:bloc_test/core/base/model/profile_model.dart';
import 'package:bloc_test/core/base/service/interface_profile_service.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IProfileService profileService;

  ProfileBloc(
    this.profileService,
  ) : super(const ProfileState.initial()) {
    on<SetProfileData>((event, emit) async {
      try {
        // await authCacheManager.updateTokenFromStorage();
        final response = await profileService.getProfile();
        emit(ProfileState.setProfileData(response!));
        print('get prifile: $response');
      } catch (e) {
        print(e);
      }
    });
  }
}
