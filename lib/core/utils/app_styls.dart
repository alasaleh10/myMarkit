import 'package:flutter/material.dart';
import 'package:my_markit/core/responsive_adaptive_helper/responsive_text.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_fonts.dart';

abstract class AppStyle {
  static TextStyle style25Reqular(BuildContext context) {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.medinaFont,
        color: AppColors.kPrimaryColor,
        fontSize: getResponsiveFontSize(context, fontSize: 25));
  }

  static TextStyle style20Bold(BuildContext context) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: AppFonts.medinaFont,
        color: AppColors.kPrimaryColor,
        fontSize: getResponsiveFontSize(context, fontSize: 20));
  }

  static TextStyle style19Regular(BuildContext context) {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.medinaFont,
        color: AppColors.kPrimaryColor,
        fontSize: getResponsiveFontSize(context, fontSize: 19));
  }
}
