import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mt_6_dz1/features/quiz/data/model/Quiz_Model.dart';
import 'package:mt_6_dz1/features/quiz/data/model/result_model.dart';
import 'package:mt_6_dz1/features/quiz/ui/finish_screen.dart';
import 'package:mt_6_dz1/features/quiz/ui/main.dart';

class SecondQuizPage extends StatefulWidget {
  String difficulty;
   int currentQuestion;
  final List<QuizModel> list;
   SecondQuizPage({super.key, required this.list,
     required this.currentQuestion,required this.difficulty});

  @override
  State<SecondQuizPage> createState() => _SecondQuizPageState();
}

class _SecondQuizPageState extends State<SecondQuizPage> {
  Color getRandom(){
final ranColors=[
  Colors.deepPurple,
  Colors.blue,
  Colors.red,
  Colors.white,

];
final Random random = Random();
return ranColors[random.nextInt(ranColors.length)];
  }

  final Random random = Random();

  final List<String> listAnswers = [];

  Color color=Colors.white;
  int lastClickedIndex=0;
  int rightAnswers=0;


  @override
  void initState() {
    super.initState();
    updateAnswers();
  }

  void updateAnswers() {
    listAnswers
      ..clear()
      ..addAll(widget.list[widget.currentQuestion].incorrect_answers)
      ..add(widget.list[widget.currentQuestion].correct_answer)
      ..shuffle(random);
  }

  void finishQuiz() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FinishScreen(
          resultModel: ResultModel(
            widget.list.length,
            rightAnswers,
            widget.difficulty,
            widget.list.first.category,
            ((rightAnswers / widget.list.length) * 100).toInt(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Text('${widget.currentQuestion+1}/${widget.list.length}'),
            SizedBox(height: 100,),
            Text(widget.list[widget.currentQuestion].question,style:
            TextStyle(fontSize: 20,),textAlign: TextAlign.center,),
            SizedBox(height:20),
          Expanded(
            child: ListView.separated(itemCount: listAnswers.length,
                separatorBuilder: (_, __)=>SizedBox(height: 10,),
                itemBuilder:(context,index){
              return ElevatedButton(style: ElevatedButton.styleFrom(
                backgroundColor: lastClickedIndex==index ? color : Colors.white
              ),
                  onPressed: ()async{
                    await Future.sync(()async {

                      bool isRight=listAnswers[index]==widget.list[widget.currentQuestion].correct_answer;
                      lastClickedIndex=index;
                      if (isRight) {
rightAnswers+=1;
                        color=Colors.green;
                      }else{
                        color=Colors.red;
                      }
                      if (widget.currentQuestion == widget.list.length-1) {
                        setState(() {});
                        await Future.delayed(Duration(seconds: 1));
                        finishQuiz();
                        return;
                      }
                      setState(() {
                      });
                      await Future.delayed(Duration(seconds: 1));
color=Colors.white;
                      widget.currentQuestion += 1;
                      updateAnswers();
                      setState(() {});
                    });
                  },
                  child: Text(listAnswers[index]));
                } ),
          )
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,floatingActionButton:
    FloatingActionButton.small(onPressed: (){
        finishQuiz();
      },
      child: Center(
        child: Text('Skip',style:
          TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      backgroundColor: Colors.pinkAccent,),
    );
  }
void showSnack(BuildContext context,bool isRight){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(isRight ? 'Right' : 'Wrong'),
      duration:Duration(microseconds: 500),
    backgroundColor: isRight ? Colors.green : Colors.red,));
}
}
