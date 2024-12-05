import 'package:cryptoapp/source/local/authentication.dart';

class DbRepositoryImpl implements DbRepository {
  final AppDatabase appDatabase = AppDatabase();

  @override
  Future<AuthenticationData?> getCurrentAuthentication() {
    return appDatabase.select(appDatabase.authentication).getSingleOrNull();
  }

  @override
  Future<int> insertAuthentication(String userId, String currentEmail) {
    return appDatabase
        .into(appDatabase.authentication)
        .insert(AuthenticationCompanion.insert(
          userId: userId,
          emailLogged: currentEmail,
        ));
  }

  @override
  Future<void> deleteAuthentication() {
    return appDatabase.delete(appDatabase.authentication).go();
  }
}

abstract class DbRepository {
  Future<AuthenticationData?> getCurrentAuthentication();

  Future<int> insertAuthentication(String userId, String currentEmail);

  Future<void> deleteAuthentication();
}
