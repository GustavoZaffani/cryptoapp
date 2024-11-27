import 'package:cryptoapp/model/login.dart';
import 'package:cryptoapp/model/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'http://192.168.68.121:8080/v1')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/users/{userId}')
  Future<User> getUser(@Path() String userId);

  @POST('/login')
  Future<String> login(@Body() Login login);
}