part of 'quiz_cubit.dart';

@immutable
sealed class QuizState {}

final class QuizInitial extends QuizState {}
final class QuizLoading extends QuizState {}
final class QuizLoaded extends QuizState {
  final List<QuizModel>list;

  QuizLoaded(this.list);
}
final class QuizError extends QuizState {}
