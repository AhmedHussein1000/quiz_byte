import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/themes/app_colors.dart';
import 'package:quiz_app/core/helpers/assets.dart';
import 'package:quiz_app/features/quiz/controllers/questions_controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionsController>(
      builder: (controller) {
        return Container(
          width: double.infinity,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kGrayColor),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return AnimatedBuilder(
                animation: controller.animation,
                builder: (context, child) {
                  return Stack(
                    children: [
                      Container(
                        width:
                            constraints.maxWidth * controller.animation.value,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: kPrimaryGradient),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${(controller.animation.value * 60).round()} sec'),
                            SvgPicture.asset(
                              Assets.iconsClock,
                              colorFilter: const ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
