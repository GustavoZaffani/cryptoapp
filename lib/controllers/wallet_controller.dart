import 'package:cryptoapp/controllers/login_controller.dart';
import 'package:cryptoapp/controllers/utils.dart';
import 'package:cryptoapp/model/wallet.dart';
import 'package:cryptoapp/repositories/rest_repository.dart';

class WalletController {
  final RestRepository restRepository = RestRepositoryImpl();
  final LoginController loginController = LoginController();

  Future<void> retrieveWallet({
    required OnSuccessCallback<Wallet> onSuccess,
    required OnErrorCallback onError,
    required OnLoadingCallback onLoading,
    required OnFinallyCallback onFinally,
  }) async {
    try {
      onLoading();

      await loginController.getCurrentAuthentication(
        onSuccess: (data) async {
          if (data != null) {
            onSuccess(await restRepository.retrieveWallet(userId: data.userId));
          }
        },
        onError: (error) => onError(error),
        onLoading: () {},
        onFinally: () {},
      );
    } catch (e) {
      onError("Erro ao fazer a requisição: $e");
    } finally {
      onFinally();
    }
  }
}