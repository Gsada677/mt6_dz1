import 'package:json_annotation/json_annotation.dart';
part 'Quiz_Model.g.dart';
@JsonSerializable()
class QuizModel{
 final String difficulty;
 final String type;
 final String category;
 final String question;
 final String correct_answer;
 final List<String>incorrect_answers;


  QuizModel({required this.type, required this.category, required this.question, required this.correct_answer, required this.incorrect_answers, required this.difficulty});
 factory QuizModel.fromJson(Map<String, dynamic> json) =>
     _$QuizModelFromJson(json);

 Map<String, dynamic> toJson() => _$QuizModelToJson(this);

}