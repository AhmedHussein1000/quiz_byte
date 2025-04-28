import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/helpers/dummy_data.dart';
import 'package:quiz_app/features/quiz/controllers/questions_controller.dart';
import 'package:quiz_app/features/quiz/views/widgets/question_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class QuestionsPageviewLoading extends StatelessWidget {
  const QuestionsPageviewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final questionController = Get.find<QuestionsController>();
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
      ),
      child: PageView.builder(
        itemCount: dummyQuestions.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => QuestionCard(
          questionModel: dummyQuestions[index],
        ),
        controller: questionController.pageController,
      ),
    );
  }
}
