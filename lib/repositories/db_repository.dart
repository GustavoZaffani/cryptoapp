import 'package:cryptoapp/source/local/authentication.dart';

class DbRepositoryImpl implements DbRepository {
  @override
  Future<AuthenticationData?> getCurrentAuthentication() {
    AppDatabase appDatabase = AppDatabase();
    return appDatabase.select(appDatabase.authentication).getSingleOrNull();
  }

  @override
  Future<int> insertAuthentication(String userId, String currentEmail) {
    AppDatabase appDatabase = AppDatabase();

    return appDatabase
        .into(appDatabase.authentication)
        .insert(AuthenticationCompanion.insert(
          userId: userId,
          emailLogged: currentEmail,
        ));
  }
}

abstract class DbRepository {
  Future<AuthenticationData?> getCurrentAuthentication();

  Future<int> insertAuthentication(String userId, String currentEmail);


}
