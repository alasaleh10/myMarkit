import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_images.dart';

class CustomFloatActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFloatActionButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: AppColors.kPrimiryColor3,
      onPressed: onPressed,
      label: SvgPicture.asset(
        Assets.imagesAdd2,
        height: 40,
        colorFilter:
            const ColorFilter.mode(AppColors.kPrimaryColor, BlendMode.srcIn),
      ),
    );
  }
}
