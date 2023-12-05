import 'package:bloc_test/core/base/model/post_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://jsonplaceholder.typicode.com/')
abstract class ApiService {
  factory ApiService(Dio di) = _ApiService;

  @GET('posts')
  Future<List<PostModel>> getPosts();
}
