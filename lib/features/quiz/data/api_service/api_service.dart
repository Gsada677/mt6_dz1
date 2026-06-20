import 'package:dio/dio.dart';
import 'package:mt_6_dz1/features/quiz/data/model/Quiz_Model.dart';
import 'package:mt_6_dz1/features/quiz/data/model/result_model.dart';
class ApiService {
  final dio=Dio();
  Future<List<QuizModel>>getQuiz()async{
    final response=await dio.get('https://opentdb.com/api.php?amount=10&category=10&type=multiple');
    return getQuiz();
  }
}