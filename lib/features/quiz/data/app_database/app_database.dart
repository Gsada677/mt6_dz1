import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'Quizes.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Results])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'quiz_database',
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse('sqlite3.wasm'),
        driftWorker: Uri.parse('drift_worker.js'),
      ),
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  Future<int> addResult(ResultsCompanion result) {
    return into(results).insert(result);
  }

  Future<List<Result>> getAllResults() {
    return (select(results)..orderBy([(table) => OrderingTerm.desc(table.id)]))
        .get();
  }

  Stream<List<Result>> watchAllResults() {
    return (select(results)..orderBy([(table) => OrderingTerm.desc(table.id)]))
        .watch();
  }

  Future<int> deleteResult(int id) {
    return (delete(results)..where((table) => table.id.equals(id))).go();
  }

  Future<int> deleteAllResults() {
    return delete(results).go();
  }
}
