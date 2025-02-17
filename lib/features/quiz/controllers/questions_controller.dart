import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/routes/routes.dart';
import 'package:quiz_app/features/quiz/models/question_model.dart';
import 'package:quiz_app/features/quiz/repository/base_questions_repo.dart';

class QuestionsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final BaseQuestionsRepo baseQuestionsRepo;
  late final AnimationController animationController;
  late final Animation<double> animation;
  late final PageController pageController;
  var isLoading = true.obs;
  var errorText = ''.obs;
  var questions = <QuestionModel>[].obs;
  int finalCorrectAnswersCount = 0;
  bool isAnswered = false;
  var selectedAnswer = ''.obs;
  var questionNumber = 1.obs;
  
  @override
  void onInit() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 120));
    animation = Tween<double>(begin: 0, end: 1).animate(animationController)
      ..addListener(
        () => update(),
      );

    pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    pageController.dispose();
    super.dispose();
  }

  void reset() {
    finalCorrectAnswersCount = 0;
    isAnswered = false;
    selectedAnswer.value = '';
    questionNumber.value = 1;
    questions.clear();
    if (pageController.hasClients) {
      pageController.jumpToPage(0);
    }
    animationController.reset();
    update();
  }

  QuestionsController(this.baseQuestionsRepo);

  void getQuestions(
      {required String category, required String difficulty}) async {
    try {
      isLoading(true);
      var result = await baseQuestionsRepo.getQuestions(
          category: category, difficulty: difficulty);
      result.fold((failure) => errorText.value = failure.message,
          (categoryQuestions) => questions.value = categoryQuestions);
    } finally {
      isLoading(false);
    }
  }

  void checkAnswer(
      {required QuestionModel question, required String selectedAnswer}) async {
    isAnswered = true;
    this.selectedAnswer.value = selectedAnswer;
    if (question.getCorrectAnswers().contains(selectedAnswer)) {
      finalCorrectAnswersCount += 1;
    }
    animationController.stop();
    update();
    await Future.delayed(const Duration(seconds: 10));
    nextQuestion();
  }

  void nextQuestion() {
    if (questionNumber.value < questions.length) {
      isAnswered = false;
      questionNumber.value += 1;
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
      animationController.reset();
      animationController.forward().whenComplete(
            () => nextQuestion(),
          );
    } else {
      Get.offAllNamed(Routes.score);
    }
  }
}
