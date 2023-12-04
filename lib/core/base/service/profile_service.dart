import 'dart:io';

import 'package:bloc_test/core/base/model/profile_model.dart';
import 'package:bloc_test/core/base/service/interface_profile_service.dart';
import 'package:bloc_test/core/init/network/dio_manager.dart';
import 'package:bloc_test/locator.dart';

class ProfileService extends IProfileService {
  @override
  Future<Data?> getProfile() async {
    var response = await getIt<DioManager>().dio.get(
          'user',
        );
    // print('response: ${jsonEncode(response.data)}');
    if (response.statusCode == HttpStatus.ok) {
      return ProfileUser.fromJson(response.data).data;
    } else {
      return throw Exception();
    }
  }

  @override
  Future<Data?> updateProfile(
      {required String nickname, required String email}) async {
    var response = await getIt<DioManager>().dio.put('user/update-profile',
        data: {'nickname': nickname, 'email': email});
    if (response.statusCode == HttpStatus.ok) {
      return ProfileUser.fromJson(response.data).data;
    } else {
      return throw Exception();
    }
  }
}
