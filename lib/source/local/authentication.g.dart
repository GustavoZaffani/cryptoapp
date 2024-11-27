// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// ignore_for_file: type=lint
class $AuthenticationTable extends Authentication
    with TableInfo<$AuthenticationTable, AuthenticationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthenticationTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _emailLoggedMeta =
      const VerificationMeta('emailLogged');
  @override
  late final GeneratedColumn<String> emailLogged = GeneratedColumn<String>(
      'email_logged', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [userId, emailLogged];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'authentication';
  @override
  VerificationContext validateIntegrity(Insertable<AuthenticationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('email_logged')) {
      context.handle(
          _emailLoggedMeta,
          emailLogged.isAcceptableOrUnknown(
              data['email_logged']!, _emailLoggedMeta));
    } else if (isInserting) {
      context.missing(_emailLoggedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  AuthenticationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthenticationData(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      emailLogged: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email_logged'])!,
    );
  }

  @override
  $AuthenticationTable createAlias(String alias) {
    return $AuthenticationTable(attachedDatabase, alias);
  }
}

class AuthenticationData extends DataClass
    implements Insertable<AuthenticationData> {
  final String userId;
  final String emailLogged;
  const AuthenticationData({required this.userId, required this.emailLogged});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['email_logged'] = Variable<String>(emailLogged);
    return map;
  }

  AuthenticationCompanion toCompanion(bool nullToAbsent) {
    return AuthenticationCompanion(
      userId: Value(userId),
      emailLogged: Value(emailLogged),
    );
  }

  factory AuthenticationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthenticationData(
      userId: serializer.fromJson<String>(json['userId']),
      emailLogged: serializer.fromJson<String>(json['emailLogged']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'emailLogged': serializer.toJson<String>(emailLogged),
    };
  }

  AuthenticationData copyWith({String? userId, String? emailLogged}) =>
      AuthenticationData(
        userId: userId ?? this.userId,
        emailLogged: emailLogged ?? this.emailLogged,
      );
  AuthenticationData copyWithCompanion(AuthenticationCompanion data) {
    return AuthenticationData(
      userId: data.userId.present ? data.userId.value : this.userId,
      emailLogged:
          data.emailLogged.present ? data.emailLogged.value : this.emailLogged,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuthenticationData(')
          ..write('userId: $userId, ')
          ..write('emailLogged: $emailLogged')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, emailLogged);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthenticationData &&
          other.userId == this.userId &&
          other.emailLogged == this.emailLogged);
}

class AuthenticationCompanion extends UpdateCompanion<AuthenticationData> {
  final Value<String> userId;
  final Value<String> emailLogged;
  final Value<int> rowid;
  const AuthenticationCompanion({
    this.userId = const Value.absent(),
    this.emailLogged = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AuthenticationCompanion.insert({
    required String userId,
    required String emailLogged,
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        emailLogged = Value(emailLogged);
  static Insertable<AuthenticationData> custom({
    Expression<String>? userId,
    Expression<String>? emailLogged,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (emailLogged != null) 'email_logged': emailLogged,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AuthenticationCompanion copyWith(
      {Value<String>? userId, Value<String>? emailLogged, Value<int>? rowid}) {
    return AuthenticationCompanion(
      userId: userId ?? this.userId,
      emailLogged: emailLogged ?? this.emailLogged,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (emailLogged.present) {
      map['email_logged'] = Variable<String>(emailLogged.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthenticationCompanion(')
          ..write('userId: $userId, ')
          ..write('emailLogged: $emailLogged, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AuthenticationTable authentication = $AuthenticationTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [authentication];
}

typedef $$AuthenticationTableCreateCompanionBuilder = AuthenticationCompanion
    Function({
  required String userId,
  required String emailLogged,
  Value<int> rowid,
});
typedef $$AuthenticationTableUpdateCompanionBuilder = AuthenticationCompanion
    Function({
  Value<String> userId,
  Value<String> emailLogged,
  Value<int> rowid,
});

class $$AuthenticationTableFilterComposer
    extends Composer<_$AppDatabase, $AuthenticationTable> {
  $$AuthenticationTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get emailLogged => $composableBuilder(
      column: $table.emailLogged, builder: (column) => ColumnFilters(column));
}

class $$AuthenticationTableOrderingComposer
    extends Composer<_$AppDatabase, $AuthenticationTable> {
  $$AuthenticationTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get emailLogged => $composableBuilder(
      column: $table.emailLogged, builder: (column) => ColumnOrderings(column));
}

class $$AuthenticationTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuthenticationTable> {
  $$AuthenticationTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get emailLogged => $composableBuilder(
      column: $table.emailLogged, builder: (column) => column);
}

class $$AuthenticationTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AuthenticationTable,
    AuthenticationData,
    $$AuthenticationTableFilterComposer,
    $$AuthenticationTableOrderingComposer,
    $$AuthenticationTableAnnotationComposer,
    $$AuthenticationTableCreateCompanionBuilder,
    $$AuthenticationTableUpdateCompanionBuilder,
    (
      AuthenticationData,
      BaseReferences<_$AppDatabase, $AuthenticationTable, AuthenticationData>
    ),
    AuthenticationData,
    PrefetchHooks Function()> {
  $$AuthenticationTableTableManager(
      _$AppDatabase db, $AuthenticationTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuthenticationTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuthenticationTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuthenticationTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> userId = const Value.absent(),
            Value<String> emailLogged = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AuthenticationCompanion(
            userId: userId,
            emailLogged: emailLogged,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String userId,
            required String emailLogged,
            Value<int> rowid = const Value.absent(),
          }) =>
              AuthenticationCompanion.insert(
            userId: userId,
            emailLogged: emailLogged,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AuthenticationTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AuthenticationTable,
    AuthenticationData,
    $$AuthenticationTableFilterComposer,
    $$AuthenticationTableOrderingComposer,
    $$AuthenticationTableAnnotationComposer,
    $$AuthenticationTableCreateCompanionBuilder,
    $$AuthenticationTableUpdateCompanionBuilder,
    (
      AuthenticationData,
      BaseReferences<_$AppDatabase, $AuthenticationTable, AuthenticationData>
    ),
    AuthenticationData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AuthenticationTableTableManager get authentication =>
      $$AuthenticationTableTableManager(_db, _db.authentication);
}
