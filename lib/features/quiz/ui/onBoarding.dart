import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mt_6_dz1/features/quiz/ui/main.dart';
class QuizOnboarding extends StatelessWidget {
  const QuizOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset('assets/brain-v2.svg',width: 150,
        height: 200,),
      ),
      floatingActionButton:
      FloatingActionButton(onPressed: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (_)=>Quizpage()));

      },child: Text('Next',style: TextStyle(fontSize: 20,color: Colors.white),),backgroundColor: Colors.deepPurpleAccent,),
    );

  }
  
}
