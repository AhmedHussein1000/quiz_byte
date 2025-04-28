import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/functions/custom_snack_bar.dart';
import 'package:quiz_app/features/quiz/controllers/questions_controller.dart';
import 'package:quiz_app/features/quiz/views/widgets/quiz_view_body.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key, required this.category, required this.difficulty});
  final String category;
  final String difficulty;

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  final QuestionsController questionsController =
      Get.find<QuestionsController>();
  @override
  void initState() {
    questionsController.getQuestions(
        category: widget.category, difficulty: widget.difficulty);
    // بيتاكد ان الكود مش هيتنفذ الا لما الويدجت يتعملها بيلد
    WidgetsBinding.instance.addPostFrameCallback((_) {
      customSnackBar(
          context: context, content: 'You have 5 seconds between questions to see the answer and explanation.');
      questionsController.animationController
          .forward()
          .whenComplete(() => questionsController.nextQuestion());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: questionsController.nextQuestion,
            child: const Text(
              'Skip',
            ),
          )
        ],
      ),
      body: const QuizViewBody(),
    );
  }
}
