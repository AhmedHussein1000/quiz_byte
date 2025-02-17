import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.child,
      this.height,
      this.width,
      this.backgroundColor});
  final void Function()? onPressed;
  final Widget child;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? const Color(0xFF00FFCB),
          ),
          onPressed: onPressed,
          child: child),
    );
  }
}
