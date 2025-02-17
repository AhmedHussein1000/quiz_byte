import 'package:flutter/material.dart';
import 'package:quiz_app/core/themes/app_colors.dart';

class UnselectedOption extends StatelessWidget {
  const UnselectedOption({
    super.key,
     this.onTap,
    required this.index,
    required this.answerText,
  });

  final void Function()? onTap;

  final int index;
  final String answerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: kGrayColor),
            ),
            child: Row(
              children: [
                Text(
                  '${index + 1}',
                  style: const TextStyle(color: kGrayColor),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    answerText,
                    style: const TextStyle(color: kGrayColor),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: kGrayColor.withAlpha((0.1 * 255).toInt()),
                    shape: BoxShape.circle,
                    border: Border.all(color: kGrayColor),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
