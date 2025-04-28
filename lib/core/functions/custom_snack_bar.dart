import 'package:flutter/material.dart';

customSnackBar({
  required BuildContext context,
  required String content,
  Color? backgroundColor,
  Duration? duration,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black26,
      duration: duration ?? const Duration(seconds: 5),
    ),
  );
}
