// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Quiz_Model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) => QuizModel(
  type: json['type'] as String,
  category: json['category'] as String,
  question: json['question'] as String,
  correct_answer: json['correct_answer'] as String,
  incorrect_answers: (json['incorrect_answers'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  difficulty: json['difficulty'] as String,
);

Map<String, dynamic> _$QuizModelToJson(QuizModel instance) => <String, dynamic>{
  'difficulty': instance.difficulty,
  'type': instance.type,
  'category': instance.category,
  'question': instance.question,
  'correct_answer': instance.correct_answer,
  'incorrect_answers': instance.incorrect_answers,
};
