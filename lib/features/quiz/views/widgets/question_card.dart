import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/helpers/extensions.dart';
import 'package:quiz_app/core/themes/app_colors.dart';
import 'package:quiz_app/core/themes/styles.dart';
import 'package:quiz_app/features/quiz/controllers/questions_controller.dart';
import 'package:quiz_app/features/quiz/models/question_model.dart';
import 'package:quiz_app/features/quiz/views/widgets/option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.questionModel,
  });
  final QuestionModel questionModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              questionModel.question ?? '',
              style: Styles.style18Medium(context: context)
                  .copyWith(color: kBlackColor),
            ),
            const SizedBox(
              height: 10,
            ),
            ...List.generate(
              questionModel.answers?.getNoneNullAnswers().length ?? 0,
              (index) {
                return Option(
                  index: index,
                  questionModel: questionModel,
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<QuestionsController>(
                builder: (controller) => controller.isAnswered
                    ? !questionModel.explanation.isNullOrEmpty()
                        ? Text(
                            'Explanation:${questionModel.explanation}',
                            style: Styles.style16Medium(context: context)
                                .copyWith(color: kBlackColor),
                          )
                        : const SizedBox.shrink()
                    : const SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
