import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_6_dz1/Quiz_Model.dart';
import 'package:mt_6_dz1/features/quiz/ui/Quiz_Questions.dart';
import 'package:mt_6_dz1/features/quiz/ui/cubit/quiz_cubit.dart';
import 'package:mt_6_dz1/features/quiz/ui/onBoarding.dart';

void main() {
  runApp( MaterialApp(
      home:QuizOnboarding()));
}
class Quizpage extends StatefulWidget{
  @override
  State<Quizpage> createState() => _QuizPageState();
}

class _QuizPageState extends State<Quizpage> {
   String all='All';
  final cubit=QuizCubit();
  int sliderValue=10;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: BlocListener<QuizCubit, QuizState>(
          bloc: cubit,
  listener: (context, state) {

    if (state is QuizLoaded) {
      print(state.list.first);
      Navigator.push(context, MaterialPageRoute(builder: (_)=>QuizQuestions(list: state.list,)));
    }
  },
  child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/ar_tut.png',width: 150,
              height: 200,),
            Text(sliderValue.toString(),style: TextStyle(
              fontSize: 50,fontWeight: FontWeight.w900,
            ),),
            Slider(value: sliderValue.toDouble(),min:1, max:30,
                activeColor: Colors.purple,
                inactiveColor: Colors.white,
                onChanged: (double newValue)=>{
              setState(()=>{
                sliderValue=newValue.round()
              },
              ),
            }
            ),



                DropdownButtonFormField<String>(value: all,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),

                    ),
                    dropdownColor: Colors.white,
                    iconEnabledColor: Colors.deepPurpleAccent,
                    items: ['All','Easy','Medium','Hard'].map(
                            (item)=>DropdownMenuItem(value: item,
                                child: Text(item),),).toList(),
                    onChanged: (value){
                  setState(() {
                    all=value!;

                  });
                    }),
                SizedBox(height: 10,),
                 DropdownButtonFormField<String>(value: all,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),

                      ),
                      dropdownColor: Colors.white,
                      iconEnabledColor: Colors.deepPurpleAccent,
                      items: ['All','Easy','Medium','Hard'].map(
                            (item)=>DropdownMenuItem(value: item,
                          child: Text(item),),).toList(),
                      onChanged: (value){
                        setState(() {
                          all=value!;

                        });
                      }),

            SizedBox(height: 70,),
            ElevatedButton(style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)
              ),
              backgroundColor: Colors.deepPurpleAccent,
              minimumSize: Size(200, 48)
            ),
                onPressed:cubit.getQuiz,
                child: Text('Start',
                  textAlign: TextAlign.center,style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),)),
          ],
        ),
),
      ),
    );
  }
}
