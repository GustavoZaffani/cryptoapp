import 'package:cryptoapp/controllers/utils.dart';
import 'package:cryptoapp/model/login.dart';
import 'package:cryptoapp/repositories/db_repository.dart';
import 'package:cryptoapp/repositories/rest_repository.dart';
import 'package:cryptoapp/source/local/authentication.dart';

class LoginController {
  final RestRepository restRepository = RestRepositoryImpl();
  final DbRepository dbRepository = DbRepositoryImpl();

  Future<void> login({
    required Login login,
    required OnSuccessCallback<String> onSuccess,
    required OnErrorCallback onError,
    required OnLoadingCallback onLoading,
    required OnFinallyCallback onFinally,
  }) async {
    try {
      onLoading();
      onSuccess(await restRepository.login(login: login));
    } catch (e) {
      onError("Erro ao efetuar o login: $e");
    } finally {
      onFinally();
    }
  }

  Future<void> getCurrentAuthentication({
    required OnSuccessCallback<AuthenticationData?> onSuccess,
    required OnErrorCallback onError,
    required OnLoadingCallback onLoading,
    required OnFinallyCallback onFinally,
  }) async {
    try {
      onLoading();
      onSuccess(await dbRepository.getCurrentAuthentication());
    } catch (e) {
      onError("Erro ao recuperar a autenticação: $e");
    } finally {
      onFinally();
    }
  }

  Future<void> insertAuthentication({
    required String userId,
    required String currentEmail,
    required OnSuccessCallback<int> onSuccess,
    required OnErrorCallback onError,
    required OnLoadingCallback onLoading,
    required OnFinallyCallback onFinally,
  }) async {
    try {
      onLoading();
      onSuccess(await dbRepository.insertAuthentication(userId, currentEmail));
    } catch (e) {
      onError("Erro ao salvar a autenticação: $e");
    } finally {
      onFinally();
    }
  }

  Future<void> logout({
    required OnSuccessNoContentCallback onSuccess,
    required OnErrorCallback onError,
  }) async {
    try {
      await dbRepository.deleteAuthentication();
      onSuccess();
    } catch (e) {
      onError("Erro ao deslogar: $e");
    }
  }
}
