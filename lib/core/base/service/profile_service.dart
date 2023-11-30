import 'dart:convert';
import 'dart:io';

import 'package:bloc_test/core/base/model/profile_model.dart';
import 'package:bloc_test/core/base/service/interface_profile_service.dart';
import 'package:bloc_test/core/init/cache/auth_cache_manager.dart';

class ProfileService extends IProfileService {
  ProfileService(super.dioManager);
  late AuthCacheManager authCacheManager;

  @override
  Future<Data?> getProfile() async {
    var response = await dioManager.dio.get(
      'user',
    );
    print('response: ${jsonEncode(response.data)}');
    if (response.statusCode == HttpStatus.ok) {
      return ProfileUser.fromJson(response.data).data;
    } else {
      return throw Exception();
    }
  }
}
