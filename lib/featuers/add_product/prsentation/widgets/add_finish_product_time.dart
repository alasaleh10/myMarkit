import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_styls.dart';
import 'package:my_markit/featuers/add_product/prsentation/view_model/add_product_cuibt/add_product_cubit.dart';

class AddFinishProductTime extends StatelessWidget {
  const AddFinishProductTime({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<AddProductCubit>(context);
    return OutlinedButton(
      style: ButtonStyle(
          side: const MaterialStatePropertyAll(
              BorderSide(color: AppColors.kPrimaryColor)),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: AppColors.kPrimaryColor)))),
      onPressed: () async {
        var selectedTime = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2060));
        controller.selectTime(time: selectedTime ?? DateTime.now());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: FittedBox(
          child: Text(
            'إضــافة تاريخ الإنتهاء',
            style: AppStyle.style20Bold(context),
          ),
        ),
      ),
    );
  }
}
