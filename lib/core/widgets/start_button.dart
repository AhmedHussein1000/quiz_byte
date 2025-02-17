import 'package:flutter/material.dart';
import 'package:quiz_app/core/themes/app_colors.dart';
import 'package:quiz_app/core/themes/styles.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key, required this.onTap, required this.btnText});
  final void Function() onTap;
  final String btnText;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          gradient: kPrimaryGradient,
        ),
        child: Text(
          btnText,
          style: Styles.style18Medium(context: context).copyWith(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
