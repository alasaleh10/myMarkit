import 'package:flutter/material.dart';
import 'package:my_markit/core/utils/app_colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.kPrimaryColor,
      ),
    );
  }
}
