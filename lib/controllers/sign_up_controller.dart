import 'package:cryptoapp/controllers/login_controller.dart';
import 'package:cryptoapp/controllers/utils.dart';
import 'package:cryptoapp/model/user.dart';
import 'package:cryptoapp/repositories/rest_repository.dart';

class SignUpController {
  final RestRepository restRepository = RestRepositoryImpl();
  final LoginController loginController = LoginController();

  Future<void> createUser({
    required String name,
    required String email,
    required String password,
    required OnSuccessCallback<User> onSuccess,
    required OnErrorCallback onError,
    required OnLoadingCallback onLoading,
    required OnFinallyCallback onFinally,
  }) async {
    try {
      onLoading();
      onSuccess(await restRepository.saveUser(
          user: User(
        name: name,
        email: email,
        password: password,
      )));
    } catch (e) {
      onError("Erro ao criar novo usuário: $e");
    } finally {
      onFinally();
    }
  }
}
