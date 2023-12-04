import 'package:bloc_test/core/base/model/profile_model.dart';
import 'package:bloc_test/core/init/network/dio_manager.dart';

abstract class IProfileService {
  IProfileService();
  Future<Data?> getProfile();
  Future<Data?> updateProfile(
      {required String nickname, required String email});
}
