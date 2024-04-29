import 'package:flutter/material.dart';
import 'package:my_markit/core/utils/app_colors.dart';

abstract class AppTheame {
  static ThemeData theamdata = ThemeData(
      fontFamily: 'Madani',
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.kPrimaryColor,
          iconTheme: IconThemeData(color: Colors.white)),
      scaffoldBackgroundColor: AppColors.kPrimiryColor3);
}
