import 'package:quiz_app/features/quiz/models/correct_answers_model.dart';

class AnswersModel {
  final String? answerA;
  final String? answerB;
  final String? answerC;
  final String? answerD;
  final String? answerE;
  final String? answerF;

  const AnswersModel(
      {required this.answerA,
      required this.answerB,
      required this.answerC,
      required this.answerD,
      required this.answerE,
      required this.answerF});
  factory AnswersModel.fromJson(Map<String, dynamic> json) {
    return AnswersModel(
        answerA: json['answer_a'],
        answerB: json['answer_b'],
        answerC: json['answer_c'],
        answerD: json['answer_d'],
        answerE: json['answer_e'],
        answerF: json['answer_f']);
  }
  List<String?> getNoneNullAnswers() {
    final answers = [answerA, answerB, answerC, answerD, answerE, answerF];
    return answers.where((answer) => answer != null).toList();
  }

  List<String?> getCorrectAnswers(
      {required CorrectAnswersModel? correctAnswers}) {
    if (correctAnswers != null) {
      final answers = [answerA, answerB, answerC, answerD, answerE, answerF];
      final corrects = [
        correctAnswers.answerACorrect == 'true',
        correctAnswers.answerBCorrect == 'true',
        correctAnswers.answerCCorrect == 'true',
        correctAnswers.answerDCorrect == 'true',
        correctAnswers.answerECorrect == 'true',
        correctAnswers.answerFCorrect == 'true',
      ];
      final List<String?> correctAnswersList = [];
      for (int i = 0; i < answers.length; i++) {
        if (answers[i] != null && corrects[i]) {
          correctAnswersList.add(answers[i]);
        }
      }
      return correctAnswersList;
    }
    return [];
  }
}
