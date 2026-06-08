import 'package:dio/dio.dart';
import 'package:mt_6_dz1/Quiz_Model.dart';

class Repo {
  Future<List<QuizModel>> getQuiz()async{
    final Dio dio=Dio();
    final response=await dio.get(
        'https://opentdb.com/api.php?amount=10&category=10&type=multiple');
    List<dynamic>data=response.data['results'];
    final list= data.map((json)=> QuizModel.fromJson(json)).toList();
   return list;
  }
}