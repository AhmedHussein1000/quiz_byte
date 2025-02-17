class CorrectAnswersModel {
  final String answerACorrect;
  final String answerBCorrect;
  final String answerCCorrect;
  final String answerDCorrect;
  final String answerECorrect;
  final String answerFCorrect;

  const CorrectAnswersModel(
      {required this.answerACorrect,
      required this.answerBCorrect,
      required this.answerCCorrect,
      required this.answerDCorrect,
      required this.answerECorrect,
      required this.answerFCorrect});
  factory CorrectAnswersModel.fromJson(Map<String, dynamic> json) {
    return CorrectAnswersModel(
        answerACorrect: json['answer_a_correct'],
        answerBCorrect: json['answer_b_correct'],
        answerCCorrect: json['answer_c_correct'],
        answerDCorrect: json['answer_d_correct'],
        answerECorrect: json['answer_e_correct'],
        answerFCorrect: json['answer_f_correct']);
  }
  List<String?> correctAnswersList() {
    final correctAnswers = [
      answerACorrect,
      answerBCorrect,
      answerCCorrect,
      answerDCorrect,
      answerECorrect,
      answerFCorrect
    ];
    return correctAnswers;
  }
}
