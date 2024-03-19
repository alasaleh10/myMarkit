import 'package:flutter/material.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_styls.dart';

class TypeSearchContiner extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;
  const TypeSearchContiner(
      {super.key,
      required this.isActive,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color:
                isActive ? AppColors.kPrimaryColor : AppColors.kPrimiryColor3,
            border: Border.all(color: AppColors.kPrimaryColor),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            title,
            style: AppStyle.style20Bold(context).copyWith(
                color: isActive
                    ? AppColors.kPrimiryColor3
                    : AppColors.kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
