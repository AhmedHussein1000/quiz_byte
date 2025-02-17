import 'package:quiz_app/features/quiz/models/answers_model.dart';
import 'package:quiz_app/features/quiz/models/correct_answers_model.dart';

class QuestionModel {
  final int? id;
  final String? question;
  final AnswersModel? answers;
  final CorrectAnswersModel? correctAnswers;
  final String? explanation;

  const QuestionModel(
      {required this.id,
      required this.question,
      required this.answers,
      required this.correctAnswers,
      required this.explanation});
  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
        id: json['id'],
        question: json['question'],
        answers: json['answers'] != null
            ? AnswersModel.fromJson(json['answers'])
            : null,
        correctAnswers: json['correct_answers'] != null
            ? CorrectAnswersModel.fromJson(json['correct_answers'])
            : null,
        explanation: json['explanation']);
  }
  List<String?> getCorrectAnswers() {
    return answers?.getCorrectAnswers(correctAnswers: correctAnswers) ?? [];
  }
}
