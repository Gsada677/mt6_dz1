import 'package:drift/drift.dart';

class Results extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get allQuestions => integer()();

  IntColumn get rightAnswers => integer()();

  TextColumn get difficulty => text()();

  TextColumn get category => text()();

  IntColumn get percentage => integer()();
}
