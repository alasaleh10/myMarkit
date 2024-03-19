import 'package:flutter/material.dart';
import 'package:my_markit/core/utils/app_colors.dart';

OutlineInputBorder textFormBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.kPrimaryColor),
      borderRadius: BorderRadius.circular(10));
}
