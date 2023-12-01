import 'package:bloc_test/core/base/model/profile_model.dart';
import 'package:bloc_test/core/init/network/dio_manager.dart';

abstract class IProfileService {
  final DioManager dioManager;
  IProfileService(this.dioManager);
  Future<Data?> getProfile();
  Future<Data?> updateProfile(
      {required String nickname, required String email});
}
