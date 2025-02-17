import 'package:flutter/material.dart';
import 'package:quiz_app/core/themes/app_colors.dart';

class CorrectOrIncorrectOption extends StatelessWidget {
  const CorrectOrIncorrectOption({
    super.key,
    required this.isCorrectAnswer,
    required this.index,
    required this.answerText,
  });

  final int index;
  final String answerText;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: isCorrectAnswer
                ? kGreenColor.withAlpha((0.3*255).toInt())
                : kRedColor.withAlpha((0.3*255).toInt()),
            borderRadius: BorderRadius.circular(8),
            border:
                Border.all(color: isCorrectAnswer ? kGreenColor : kRedColor),
          ),
          child: Row(
            children: [
              Text(
                '${index + 1}',
                style:
                    TextStyle(color: isCorrectAnswer ? kGreenColor : kRedColor),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  answerText,
                  style:
                      TextStyle(color: isCorrectAnswer ? kGreenColor : kRedColor),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 18,
                height: 18,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCorrectAnswer ? kGreenColor : kRedColor,
                  border: Border.all(
                      color: isCorrectAnswer ? kGreenColor : kRedColor),
                ),
                child: isCorrectAnswer
                    ? const Icon(
                        Icons.done,
                        size: 12,
                      )
                    : const Icon(
                        Icons.close,
                        size: 12,
                      ),
              )
            ],
          )),
    );
  }
}
