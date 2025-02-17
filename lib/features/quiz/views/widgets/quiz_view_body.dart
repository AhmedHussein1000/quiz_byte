import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/themes/styles.dart';
import 'package:quiz_app/features/quiz/controllers/questions_controller.dart';
import 'package:quiz_app/features/quiz/views/widgets/progress_bar.dart';
import 'package:quiz_app/features/quiz/views/widgets/questions_pageview.dart';

class QuizViewBody extends StatelessWidget {
  const QuizViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final QuestionsController questionsController =
        Get.find<QuestionsController>();
   
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProgressBar(),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'Question ${questionsController.questionNumber.value}',
                  style: Styles.style22Bold(context: context)),
              TextSpan(
                  text:
                      '/${questionsController.questions.isNotEmpty ? questionsController.questions.length : 0}',
                  style: Styles.style18Medium(context: context))
            ])),
          ),
          const Divider(
            thickness: 1.5,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: QuestionsPageViewGetxBuilder(
            questionsController: questionsController,
          ))
        ],
      ),
    );
  }
}
