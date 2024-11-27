import 'package:cryptoapp/model/login.dart';
import 'package:cryptoapp/model/user.dart';
import 'package:cryptoapp/source/remote/rest_client.dart';
import 'package:dio/dio.dart';

class RestRepositoryImpl implements RestRepository {
  @override
  Future<User> getUserById({required String userId}) {
    return RestClient(Dio()).getUser(userId);
  }

  @override
  Future<String> login({required Login login}) {
    return RestClient(Dio()).login(login);
  }
}

abstract class RestRepository {
  Future<User> getUserById({required String userId});
  Future<String> login({required Login login});
}
