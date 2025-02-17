import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/features/quiz/controllers/questions_controller.dart';
import 'package:quiz_app/features/quiz/models/question_model.dart';
import 'package:quiz_app/features/quiz/views/widgets/correct_or_incorrect_option.dart';
import 'package:quiz_app/features/quiz/views/widgets/unselected_option.dart';

class Option extends StatelessWidget {
  const Option({super.key, required this.questionModel, required this.index});
  final QuestionModel questionModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionsController>(
      builder: (controller) {
        final noneNullAnswers =
            questionModel.answers?.getNoneNullAnswers() ?? [];
        final selectedAnswer = controller.selectedAnswer;
        final correctAnswers = questionModel.getCorrectAnswers();
        final isSelected = selectedAnswer.value == noneNullAnswers[index];
        final isCorrect = correctAnswers.contains(noneNullAnswers[index]);
        if (controller.isAnswered) {
          if (isCorrect) {
            return CorrectOrIncorrectOption(
                isCorrectAnswer: true,
                index: index,
                answerText: noneNullAnswers[index] ?? '');
          } else if (isSelected) {
            return CorrectOrIncorrectOption(
                isCorrectAnswer: false,
                index: index,
                answerText: noneNullAnswers[index] ?? '');
          }
          return UnselectedOption(
              index: index,
              answerText: noneNullAnswers[index] ?? '');
        } else {
          return UnselectedOption(
            onTap: () {
              controller.checkAnswer(
                  question: questionModel,
                  selectedAnswer: noneNullAnswers[index] ?? '');
            },
            index: index,
            answerText:
                questionModel.answers?.getNoneNullAnswers()[index] ?? '',
          );
        }
      },
    );
  }
}
