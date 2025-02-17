import 'package:flutter/material.dart';
import 'package:quiz_app/core/themes/app_colors.dart';

abstract class Styles {
  static TextStyle style16regular({required BuildContext context}) => TextStyle(
      fontSize: getResponsiveFontSize(context: context, fontSize: 16),
      fontWeight: FontWeight.w400,
      color: Colors.white);
  static TextStyle style16Medium({required BuildContext context}) => TextStyle(
        fontSize: getResponsiveFontSize(context: context, fontSize: 16),
        fontWeight: FontWeight.w500,
      );
  static TextStyle style16SemiBold({required BuildContext context}) =>
      TextStyle(
          fontSize: getResponsiveFontSize(context: context, fontSize: 16),
          fontWeight: FontWeight.w600);
  static TextStyle style18Medium({required BuildContext context}) => TextStyle(
      fontSize: getResponsiveFontSize(context: context, fontSize: 22),
      fontWeight: FontWeight.w500,
      color: kDarkGraySecondaryColor);
  static TextStyle style22Bold({required BuildContext context}) => TextStyle(
      fontSize: getResponsiveFontSize(context: context, fontSize: 22),
      fontWeight: FontWeight.bold,
      color: kDarkGraySecondaryColor);
  static TextStyle style32Bold({required BuildContext context}) => TextStyle(
        fontSize: getResponsiveFontSize(context: context, fontSize: 32),
        fontWeight: FontWeight.bold,
      );
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  double scaleFactor = width / 412;
  return scaleFactor;
}

double getResponsiveFontSize(
    {required BuildContext context, required double fontSize}) {
  double lowerLimit = 0.8 * fontSize;
  double upperLimit = 1.2 * fontSize;

  double responsiveFontSize = getScaleFactor(context) * fontSize;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}
