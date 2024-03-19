import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/functions/barcode_sound.dart';
import 'package:my_markit/core/routers/app_routers.dart';

import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_styls.dart';
import 'package:my_markit/featuers/add_product/prsentation/view_model/add_product_cuibt/add_product_cubit.dart';

class AddProductBarcode extends StatelessWidget {
  const AddProductBarcode({super.key});

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
        var res = await GoRouter.of(context).pushNamed(AppRouters.barcode);

        if (res.toString().length >= 3) {
          await barcodeSound();

          controller.selectBarcode(barcode: res.toString());
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: FittedBox(
          child: Text(
            'إضــافة الـباركـود',
            style: AppStyle.style20Bold(context),
          ),
        ),
      ),
    );
  }
}
