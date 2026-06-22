class ResultModel {
  final int rightAnswers;
  final int allQuestions;
  final String difficulty;
  final String category;
  final int percentage;

  ResultModel(
    this.allQuestions,
    this.rightAnswers,
    this.difficulty,
    this.category,
    this.percentage,
  );

  int get precentage => percentage;
}
