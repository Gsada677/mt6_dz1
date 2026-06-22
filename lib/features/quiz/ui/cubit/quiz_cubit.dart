import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mt_6_dz1/features/quiz/data/model/Quiz_Model.dart';
import 'package:mt_6_dz1/features/quiz/data/repositoryi/repo.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());
  void getQuiz(){
    emit(QuizLoading());
    final repo=Repo();
    repo.getQuiz().then((value)=>emit(QuizLoaded(value,)));
  }

  void getQuizBySliderValue(int sliderValue){
    emit(QuizLoading());
    final repo=Repo();
    repo.getQuiz(amount: sliderValue).then((value)=>emit(QuizLoaded(value,)));
  }

  void getQuizByDifficulty(int amount, String difficulty){
    emit(QuizLoading());
    final repo=Repo();
    if (difficulty == 'All') {
      repo.getQuiz(amount: amount).then((value)=>emit(QuizLoaded(value,)));
    } else {
      repo.getDifficult(
        amount: amount,
        difficulty: difficulty.toLowerCase(),
      ).then((value)=>emit(QuizLoaded(value,)));
    }
  }

}
