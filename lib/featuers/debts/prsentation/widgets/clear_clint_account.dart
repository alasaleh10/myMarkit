import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_styls.dart';
import 'package:my_markit/core/widgets/custom_elevated_button.dart';
import 'package:my_markit/featuers/debts/data/models/clint_model.dart';
import 'package:my_markit/featuers/debts/prsentation/view_model/display_debts_cuibt/display_debets_cubit.dart';

class ClearClintAccount extends StatelessWidget {
  final ClintModel clintModel;
  final BuildContext context2;
  const ClearClintAccount(
      {super.key, required this.context2, required this.clintModel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      backgroundColor: AppColors.kPrimiryColor3,
      icon: Column(
        children: [
          Text(
            'هل تود تصفية حساب\n${clintModel.clintName}',
            style: AppStyle.style19Regular(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                  child: CustomElevatedButton(
                      title: 'إلــغاء',
                      onPressed: () {
                        context.pop();
                      })),
              const SizedBox(width: 15),
              Expanded(
                  child: CustomElevatedButton(
                      title: 'تــأكيد',
                      onPressed: () {
                        BlocProvider.of<DisplayDebetsCubit>(context2)
                            .clearClintAccount(context,
                                id: clintModel.clintId!.toInt());
                      }))
            ],
          )
        ],
      ),
    );
  }
}
