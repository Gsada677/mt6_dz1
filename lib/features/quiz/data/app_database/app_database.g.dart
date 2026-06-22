// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ResultsTable extends Results with TableInfo<$ResultsTable, Result> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResultsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _allQuestionsMeta = const VerificationMeta(
    'allQuestions',
  );
  @override
  late final GeneratedColumn<int> allQuestions = GeneratedColumn<int>(
    'all_questions',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rightAnswersMeta = const VerificationMeta(
    'rightAnswers',
  );
  @override
  late final GeneratedColumn<int> rightAnswers = GeneratedColumn<int>(
    'right_answers',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
    'difficulty',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _percentageMeta = const VerificationMeta(
    'percentage',
  );
  @override
  late final GeneratedColumn<int> percentage = GeneratedColumn<int>(
    'percentage',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    allQuestions,
    rightAnswers,
    difficulty,
    category,
    percentage,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'results';
  @override
  VerificationContext validateIntegrity(
    Insertable<Result> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('all_questions')) {
      context.handle(
        _allQuestionsMeta,
        allQuestions.isAcceptableOrUnknown(
          data['all_questions']!,
          _allQuestionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_allQuestionsMeta);
    }
    if (data.containsKey('right_answers')) {
      context.handle(
        _rightAnswersMeta,
        rightAnswers.isAcceptableOrUnknown(
          data['right_answers']!,
          _rightAnswersMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rightAnswersMeta);
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    } else if (isInserting) {
      context.missing(_difficultyMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('percentage')) {
      context.handle(
        _percentageMeta,
        percentage.isAcceptableOrUnknown(data['percentage']!, _percentageMeta),
      );
    } else if (isInserting) {
      context.missing(_percentageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Result map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Result(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      allQuestions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}all_questions'],
      )!,
      rightAnswers: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}right_answers'],
      )!,
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}difficulty'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      percentage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}percentage'],
      )!,
    );
  }

  @override
  $ResultsTable createAlias(String alias) {
    return $ResultsTable(attachedDatabase, alias);
  }
}

class Result extends DataClass implements Insertable<Result> {
  final int id;
  final int allQuestions;
  final int rightAnswers;
  final String difficulty;
  final String category;
  final int percentage;
  const Result({
    required this.id,
    required this.allQuestions,
    required this.rightAnswers,
    required this.difficulty,
    required this.category,
    required this.percentage,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['all_questions'] = Variable<int>(allQuestions);
    map['right_answers'] = Variable<int>(rightAnswers);
    map['difficulty'] = Variable<String>(difficulty);
    map['category'] = Variable<String>(category);
    map['percentage'] = Variable<int>(percentage);
    return map;
  }

  ResultsCompanion toCompanion(bool nullToAbsent) {
    return ResultsCompanion(
      id: Value(id),
      allQuestions: Value(allQuestions),
      rightAnswers: Value(rightAnswers),
      difficulty: Value(difficulty),
      category: Value(category),
      percentage: Value(percentage),
    );
  }

  factory Result.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Result(
      id: serializer.fromJson<int>(json['id']),
      allQuestions: serializer.fromJson<int>(json['allQuestions']),
      rightAnswers: serializer.fromJson<int>(json['rightAnswers']),
      difficulty: serializer.fromJson<String>(json['difficulty']),
      category: serializer.fromJson<String>(json['category']),
      percentage: serializer.fromJson<int>(json['percentage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'allQuestions': serializer.toJson<int>(allQuestions),
      'rightAnswers': serializer.toJson<int>(rightAnswers),
      'difficulty': serializer.toJson<String>(difficulty),
      'category': serializer.toJson<String>(category),
      'percentage': serializer.toJson<int>(percentage),
    };
  }

  Result copyWith({
    int? id,
    int? allQuestions,
    int? rightAnswers,
    String? difficulty,
    String? category,
    int? percentage,
  }) => Result(
    id: id ?? this.id,
    allQuestions: allQuestions ?? this.allQuestions,
    rightAnswers: rightAnswers ?? this.rightAnswers,
    difficulty: difficulty ?? this.difficulty,
    category: category ?? this.category,
    percentage: percentage ?? this.percentage,
  );
  Result copyWithCompanion(ResultsCompanion data) {
    return Result(
      id: data.id.present ? data.id.value : this.id,
      allQuestions: data.allQuestions.present
          ? data.allQuestions.value
          : this.allQuestions,
      rightAnswers: data.rightAnswers.present
          ? data.rightAnswers.value
          : this.rightAnswers,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      category: data.category.present ? data.category.value : this.category,
      percentage: data.percentage.present
          ? data.percentage.value
          : this.percentage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Result(')
          ..write('id: $id, ')
          ..write('allQuestions: $allQuestions, ')
          ..write('rightAnswers: $rightAnswers, ')
          ..write('difficulty: $difficulty, ')
          ..write('category: $category, ')
          ..write('percentage: $percentage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    allQuestions,
    rightAnswers,
    difficulty,
    category,
    percentage,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Result &&
          other.id == this.id &&
          other.allQuestions == this.allQuestions &&
          other.rightAnswers == this.rightAnswers &&
          other.difficulty == this.difficulty &&
          other.category == this.category &&
          other.percentage == this.percentage);
}

class ResultsCompanion extends UpdateCompanion<Result> {
  final Value<int> id;
  final Value<int> allQuestions;
  final Value<int> rightAnswers;
  final Value<String> difficulty;
  final Value<String> category;
  final Value<int> percentage;
  const ResultsCompanion({
    this.id = const Value.absent(),
    this.allQuestions = const Value.absent(),
    this.rightAnswers = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.category = const Value.absent(),
    this.percentage = const Value.absent(),
  });
  ResultsCompanion.insert({
    this.id = const Value.absent(),
    required int allQuestions,
    required int rightAnswers,
    required String difficulty,
    required String category,
    required int percentage,
  }) : allQuestions = Value(allQuestions),
       rightAnswers = Value(rightAnswers),
       difficulty = Value(difficulty),
       category = Value(category),
       percentage = Value(percentage);
  static Insertable<Result> custom({
    Expression<int>? id,
    Expression<int>? allQuestions,
    Expression<int>? rightAnswers,
    Expression<String>? difficulty,
    Expression<String>? category,
    Expression<int>? percentage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (allQuestions != null) 'all_questions': allQuestions,
      if (rightAnswers != null) 'right_answers': rightAnswers,
      if (difficulty != null) 'difficulty': difficulty,
      if (category != null) 'category': category,
      if (percentage != null) 'percentage': percentage,
    });
  }

  ResultsCompanion copyWith({
    Value<int>? id,
    Value<int>? allQuestions,
    Value<int>? rightAnswers,
    Value<String>? difficulty,
    Value<String>? category,
    Value<int>? percentage,
  }) {
    return ResultsCompanion(
      id: id ?? this.id,
      allQuestions: allQuestions ?? this.allQuestions,
      rightAnswers: rightAnswers ?? this.rightAnswers,
      difficulty: difficulty ?? this.difficulty,
      category: category ?? this.category,
      percentage: percentage ?? this.percentage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (allQuestions.present) {
      map['all_questions'] = Variable<int>(allQuestions.value);
    }
    if (rightAnswers.present) {
      map['right_answers'] = Variable<int>(rightAnswers.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (percentage.present) {
      map['percentage'] = Variable<int>(percentage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResultsCompanion(')
          ..write('id: $id, ')
          ..write('allQuestions: $allQuestions, ')
          ..write('rightAnswers: $rightAnswers, ')
          ..write('difficulty: $difficulty, ')
          ..write('category: $category, ')
          ..write('percentage: $percentage')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ResultsTable results = $ResultsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [results];
}

typedef $$ResultsTableCreateCompanionBuilder =
    ResultsCompanion Function({
      Value<int> id,
      required int allQuestions,
      required int rightAnswers,
      required String difficulty,
      required String category,
      required int percentage,
    });
typedef $$ResultsTableUpdateCompanionBuilder =
    ResultsCompanion Function({
      Value<int> id,
      Value<int> allQuestions,
      Value<int> rightAnswers,
      Value<String> difficulty,
      Value<String> category,
      Value<int> percentage,
    });

class $$ResultsTableFilterComposer
    extends Composer<_$AppDatabase, $ResultsTable> {
  $$ResultsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get allQuestions => $composableBuilder(
    column: $table.allQuestions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rightAnswers => $composableBuilder(
    column: $table.rightAnswers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get percentage => $composableBuilder(
    column: $table.percentage,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ResultsTableOrderingComposer
    extends Composer<_$AppDatabase, $ResultsTable> {
  $$ResultsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get allQuestions => $composableBuilder(
    column: $table.allQuestions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rightAnswers => $composableBuilder(
    column: $table.rightAnswers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get percentage => $composableBuilder(
    column: $table.percentage,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ResultsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ResultsTable> {
  $$ResultsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get allQuestions => $composableBuilder(
    column: $table.allQuestions,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rightAnswers => $composableBuilder(
    column: $table.rightAnswers,
    builder: (column) => column,
  );

  GeneratedColumn<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get percentage => $composableBuilder(
    column: $table.percentage,
    builder: (column) => column,
  );
}

class $$ResultsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ResultsTable,
          Result,
          $$ResultsTableFilterComposer,
          $$ResultsTableOrderingComposer,
          $$ResultsTableAnnotationComposer,
          $$ResultsTableCreateCompanionBuilder,
          $$ResultsTableUpdateCompanionBuilder,
          (Result, BaseReferences<_$AppDatabase, $ResultsTable, Result>),
          Result,
          PrefetchHooks Function()
        > {
  $$ResultsTableTableManager(_$AppDatabase db, $ResultsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ResultsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ResultsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ResultsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> allQuestions = const Value.absent(),
                Value<int> rightAnswers = const Value.absent(),
                Value<String> difficulty = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<int> percentage = const Value.absent(),
              }) => ResultsCompanion(
                id: id,
                allQuestions: allQuestions,
                rightAnswers: rightAnswers,
                difficulty: difficulty,
                category: category,
                percentage: percentage,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int allQuestions,
                required int rightAnswers,
                required String difficulty,
                required String category,
                required int percentage,
              }) => ResultsCompanion.insert(
                id: id,
                allQuestions: allQuestions,
                rightAnswers: rightAnswers,
                difficulty: difficulty,
                category: category,
                percentage: percentage,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ResultsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ResultsTable,
      Result,
      $$ResultsTableFilterComposer,
      $$ResultsTableOrderingComposer,
      $$ResultsTableAnnotationComposer,
      $$ResultsTableCreateCompanionBuilder,
      $$ResultsTableUpdateCompanionBuilder,
      (Result, BaseReferences<_$AppDatabase, $ResultsTable, Result>),
      Result,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ResultsTableTableManager get results =>
      $$ResultsTableTableManager(_db, _db.results);
}
