import 'package:flutter/material.dart';
import 'package:quiz_app/core/themes/app_colors.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(    
textButtonTheme: const TextButtonThemeData(
  style: ButtonStyle(
  foregroundColor: WidgetStatePropertyAll(kLightGreenColor) 
  )
)
);
