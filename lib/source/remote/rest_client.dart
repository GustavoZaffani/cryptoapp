import 'package:cryptoapp/model/crypto_market.dart';
import 'package:cryptoapp/model/login.dart';
import 'package:cryptoapp/model/negotiation_crypto.dart';
import 'package:cryptoapp/model/user.dart';
import 'package:cryptoapp/model/wallet.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'http://192.168.68.121:8080/v1')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/users/{userId}')
  Future<User> getUser(@Path() String userId);

  @POST('/users')
  Future<User> saveUser(@Body() User user);

  @PATCH('/users/{userId}')
  Future<User> updateUser(@Path() String userId, @Body() User user);

  @POST('/login')
  Future<String> login(@Body() Login login);

  @GET('/negotiation-crypto/{userId}')
  Future<List<NegotiationCrypto>> listNegotiationCrypto(@Path() String userId);

  @GET("/wallet/{userId}")
  Future<Wallet> retrieveWallet(@Path() String userId);

  @GET("/crypto/list")
  Future<List<CryptoMarket>> retrieveMarket();
}
