import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            // width: screenWidth(context) * .3,
            // height: screenHeight(context) * .2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SvgPicture.asset(
              image,
              height: 90,
              colorFilter: const ColorFilter.mode(
                  AppColors.kPrimaryColor, BlendMode.srcIn),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: AppStyle.style20Bold(context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
