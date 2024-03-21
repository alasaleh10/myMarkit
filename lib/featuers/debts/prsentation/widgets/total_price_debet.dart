import 'package:flutter/material.dart';
import 'package:my_markit/core/functions/decimal_numbers.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_styls.dart';

class TotalPriceDebet extends StatelessWidget {
  final int totalPriceDebet;
  const TotalPriceDebet({super.key, required this.totalPriceDebet});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .06,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.kPrimaryColor),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'الإجــمالي',
                style: AppStyle.style20Bold(context),
              ),
              Text(
                '${decimalNumer(price: totalPriceDebet)}ر.ي',
                style: AppStyle.style20Bold(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
