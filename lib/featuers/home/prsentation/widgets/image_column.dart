import 'package:flutter/material.dart';
import 'package:my_markit/core/responsive_adaptive_helper/screen_size.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_styls.dart';

class ImageColumn extends StatelessWidget {
  final String title, image;
  final VoidCallback onTap;

  const ImageColumn(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      splashColor: AppColors.kPrimaryColor,
      child: Column(
        children: [
          Container(
            width: screenWidth(context) * .3,
            height: screenHeight(context) * .2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.fill)),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: AppStyle.style20Bold(context),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
