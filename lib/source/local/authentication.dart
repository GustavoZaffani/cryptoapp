import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'authentication.g.dart';

class Authentication extends Table {
  TextColumn get userId => text().unique()();

  TextColumn get emailLogged => text()();
}

@DriftDatabase(tables: [Authentication])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'cryptodatabase');
  }
}
