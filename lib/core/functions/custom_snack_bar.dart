import 'package:flutter/material.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_styls.dart';

SnackBar customSnackBar(BuildContext context, {required String title}) {
  return SnackBar(
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(vertical: 20),
      backgroundColor: AppColors.kPrimaryColor,
      content: Center(
          child: FittedBox(
        child: Text(
          title,
          style: AppStyle.style20Bold(context)
              .copyWith(color: AppColors.kPrimiryColor3),
        ),
      )));
}
