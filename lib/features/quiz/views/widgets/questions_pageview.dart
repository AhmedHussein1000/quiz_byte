import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/widgets/custom_text_message.dart';
import 'package:quiz_app/features/quiz/controllers/questions_controller.dart';
import 'package:quiz_app/features/quiz/views/widgets/question_card.dart';
import 'package:quiz_app/features/quiz/views/widgets/questions_pageview_loading.dart';

class QuestionsPageViewGetxBuilder extends StatelessWidget {
  const QuestionsPageViewGetxBuilder(
      {super.key, required this.questionsController});
  final QuestionsController questionsController;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (questionsController.isLoading.value) {
          return const QuestionsPageviewLoading();
        } else if (questionsController.errorText.value.isNotEmpty) {
          return CustomTextMessage(
            text: questionsController.errorText.value,
          );
        }
        return PageView.builder(
          itemCount: questionsController.questions.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => QuestionCard(
            questionModel: questionsController.questions[index],
          ),
          controller: questionsController.pageController,
        );
      },
    );
  }
}
