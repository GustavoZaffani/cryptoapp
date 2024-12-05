import 'package:cryptoapp/controllers/login_controller.dart';
import 'package:cryptoapp/controllers/utils.dart';
import 'package:cryptoapp/model/negotiation_crypto.dart';
import 'package:cryptoapp/repositories/rest_repository.dart';

class NegotiationCryptoController {
  final RestRepository restRepository = RestRepositoryImpl();
  final LoginController loginController = LoginController();

  Future<void> listNegotiationCrypto({
    required OnSuccessCallback<List<NegotiationCrypto>> onSuccess,
    required OnErrorCallback onError,
    required OnLoadingCallback onLoading,
    required OnFinallyCallback onFinally,
  }) async {
    try {
      onLoading();

      await loginController.getCurrentAuthentication(
        onSuccess: (data) async {
          if (data != null) {
            onSuccess(await restRepository.listNegotiationCrypto(
                userId: data.userId));
          }
        },
        onError: (error) => onError(error),
        onLoading: () {},
        onFinally: () {},
      );
    } catch (e) {
      onError("Erro ao buscar as negociações: $e");
    } finally {
      onFinally();
    }
  }
}
