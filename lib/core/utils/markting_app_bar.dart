import 'package:flutter/material.dart';
import 'package:my_markit/core/responsive_adaptive_helper/screen_size.dart';

import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_styls.dart';

AppBar appBar(BuildContext context, {required String title}) {
  return AppBar(
    centerTitle: true,
    toolbarHeight: screenHeight(context) * .1,
    title: Text(
      title,
      style: AppStyle.style25Reqular(context)
          .copyWith(color: AppColors.kPrimiryColor3),
    ),
  );
}
