import 'package:flutter/material.dart';
import 'package:my_markit/core/functions/decimal_numbers.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_styls.dart';
import 'package:my_markit/core/widgets/custom_elevated_button.dart';
import 'package:my_markit/featuers/debts/data/models/clint_model.dart';
import 'package:my_markit/featuers/debts/prsentation/widgets/clear_clint_account.dart';

class TotalPriceDebet extends StatelessWidget {
  final ClintModel clintModel;
  final int totalPriceDebet;
  const TotalPriceDebet(
      {super.key, required this.totalPriceDebet, required this.clintModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.kPrimaryColor),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          Row(
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
          const SizedBox(height: 15),
          CustomElevatedButton(
              title: 'تــصفية الحـساب',
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => ClearClintAccount(
                          context2: context,
                          clintModel: clintModel,
                        ));
              })
        ],
      ),
    );
  }
}
