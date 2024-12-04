import 'package:cryptoapp/model/crypto_market.dart';
import 'package:cryptoapp/repositories/rest_repository.dart';

class MarketController {
  final RestRepository restRepository = RestRepositoryImpl();

  Future<void> listMarketData({
    required Function(List<CryptoMarket>) onSuccess,
    required Function(String) onError,
    required Function onLoading,
    required Function onFinally,
  }) async {
    try {
      onLoading();
      onSuccess(await restRepository.retrieveMarket());
    } catch (e) {
      onError(e.toString());
    } finally {
      onFinally();
    }
  }
}
