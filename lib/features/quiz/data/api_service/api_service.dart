import 'package:dio/dio.dart';
import 'package:mt_6_dz1/Quiz_Model.dart';
class ApiService {
  final dio=Dio();
  Future<List<QuizModel>>getQuiz()async{
    final response=await dio.get('https://opentdb.com/api.php?amount=10&category=10&type=multiple');
    return getQuiz();
  }

}