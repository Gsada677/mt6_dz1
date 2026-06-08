import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mt_6_dz1/Quiz_Model.dart';
import 'package:mt_6_dz1/features/quiz/data/repo.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());
  void getQuiz(){
    emit(QuizLoading());
    final repo=Repo();
    repo.getQuiz().then((value)=>emit(QuizLoaded(value)));
  }
}
