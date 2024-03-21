import 'package:flutter/material.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_styls.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final Size? size;
  final VoidCallback onPressed;
  const CustomElevatedButton(
      {super.key, required this.title, required this.onPressed, this.size});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: size,
            backgroundColor: AppColors.kPrimiryColor3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: AppColors.kPrimaryColor))),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            title,
            style: AppStyle.style20Bold(context),
          ),
        ));
  }
}
