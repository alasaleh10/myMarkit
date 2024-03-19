import 'package:flutter/material.dart';
import 'package:my_markit/core/utils/app_fonts.dart';
import 'package:my_markit/core/utils/app_styls.dart';

class PRoductDetilsRow extends StatelessWidget {
  final String title, detils;
  const PRoductDetilsRow(
      {super.key, required this.title, required this.detils});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppStyle.style20Bold(context),
          ),
          const SizedBox(width: 16),
          Text(
            detils,
            style: AppStyle.style20Bold(context)
                .copyWith(fontFamily: AppFonts.twailtFont),
          )
        ],
      ),
    );
  }
}
