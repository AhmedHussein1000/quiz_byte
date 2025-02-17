import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/helpers/extensions.dart';
import 'package:quiz_app/core/routes/routes.dart';
import 'package:quiz_app/core/themes/app_colors.dart';
import 'package:quiz_app/core/helpers/assets.dart';
import 'package:quiz_app/core/themes/styles.dart';
import 'package:quiz_app/core/widgets/start_button.dart';
import 'package:quiz_app/features/quiz/controllers/questions_controller.dart';

class ScoreView extends StatelessWidget {
  const ScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final questionsController = Get.find<QuestionsController>();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            Assets.imagesBg,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Spacer(flex: 3),
                Text(
                  'Your Score',
                  style: Styles.style32Bold(context: context)
                      .copyWith(color: kGrayColor),
                ),
                const Spacer(),
                Text(
                  "${questionsController.finalCorrectAnswersCount * 10} / ${questionsController.questions.length * 10}",
                  style: Styles.style32Bold(context: context)
                      .copyWith(color: kGrayColor),
                ),
                const Spacer(),
                StartButton(
                    onTap: () {
                      questionsController.reset();

                      context.pushNamedAndRemoveUntil(
                        Routes.categorySelection,
                        predicate: (route) => false,
                      );
                    },
                    btnText: 'Start another quiz'),
                const Spacer(flex: 3),
              ],
            ),
          )
        ],
      ),
    );
  }
}
