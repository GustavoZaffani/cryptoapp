import 'package:cryptoapp/controllers/login_controller.dart';
import 'package:cryptoapp/controllers/utils.dart';
import 'package:cryptoapp/model/user.dart';
import 'package:cryptoapp/repositories/rest_repository.dart';

class RegisterController {
  final RestRepository restRepository = RestRepositoryImpl();
  final LoginController loginController = LoginController();

  Future<void> retrieveUser({
    required OnSuccessCallback<User> onSuccess,
    required OnErrorCallback onError,
    required OnLoadingCallback onLoading,
    required OnFinallyCallback onFinally,
  }) async {
    try {
      onLoading();

      await loginController.getCurrentAuthentication(
        onSuccess: (data) async {
          if (data != null) {
            onSuccess(await restRepository.getUserById(userId: data.userId));
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

  Future<void> updateUser({
    required String name,
    required OnSuccessCallback<User> onSuccess,
    required OnErrorCallback onError,
    required OnLoadingCallback onLoading,
    required OnFinallyCallback onFinally,
  }) async {
    try {
      onLoading();

      await loginController.getCurrentAuthentication(
        onSuccess: (data) async {
          if (data != null) {
            onSuccess(await restRepository.updateUser(userId: data.userId, user: User(name: name)));
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