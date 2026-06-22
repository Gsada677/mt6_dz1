import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:mt_6_dz1/features/quiz/data/app_database/app_database.dart';
import 'package:mt_6_dz1/features/quiz/data/model/Quiz_Model.dart';
import 'package:mt_6_dz1/features/quiz/data/model/result_model.dart';

class Repo {
  Repo({AppDatabase? database}) : _database = database ?? _sharedDatabase;

  static final AppDatabase _sharedDatabase = AppDatabase();
  final AppDatabase _database;

  Future<List<QuizModel>> getQuiz({int amount = 10}) async {
    final dio = Dio();
    final response = await dio.get(
      'https://opentdb.com/api.php?amount=$amount&category=10&type=multiple',
    );
    final List<dynamic> data = response.data['results'];
    return data.map((json) => QuizModel.fromJson(json)).toList();
  }

  Future<List<QuizModel>> getDifficult({
    required int amount,
    required String difficulty,
  }) async {
    final url =
        'https://opentdb.com/api.php?amount=$amount&category=10&type=multiple&difficulty=$difficulty';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List results = data['results'];
        return results.map((e) => QuizModel.fromJson(e)).toList();
      }

      throw Exception('Server error: ${response.statusCode}');
    } catch (e) {
      throw Exception('Loading error: $e');
    }
  }

  Future<int> saveResult(ResultModel result) {
    return _database.addResult(
      ResultsCompanion.insert(
        allQuestions: result.allQuestions,
        rightAnswers: result.rightAnswers,
        difficulty: result.difficulty,
        category: result.category,
        percentage: result.percentage,
      ),
    );
  }

  Future<List<Result>> getResults() {
    return _database.getAllResults();
  }

  Stream<List<Result>> watchResults() {
    return _database.watchAllResults();
  }

  Future<int> deleteResult(int id) {
    return _database.deleteResult(id);
  }

  Future<int> deleteAllResults() {
    return _database.deleteAllResults();
  }
}
