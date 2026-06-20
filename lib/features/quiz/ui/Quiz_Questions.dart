import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mt_6_dz1/features/quiz/data/model/Quiz_Model.dart';
class QuizQuestions extends StatefulWidget {
  final List<QuizModel>list;
  const QuizQuestions({super.key ,required this.list});

  @override
  State<QuizQuestions> createState() => _QuizQuestionsState();
}

class _QuizQuestionsState extends State<QuizQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(widget.list.first.question),
        ],
      ),

    );
  }
}
