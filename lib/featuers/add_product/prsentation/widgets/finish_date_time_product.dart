import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/core/utils/app_styls.dart';
import 'package:my_markit/featuers/add_product/prsentation/view_model/add_product_cuibt/add_product_cubit.dart';

class FinishDateTimePRoduct extends StatelessWidget {
  const FinishDateTimePRoduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductCubit, AddProductState>(
      builder: (context, state) {
        final controller = BlocProvider.of<AddProductCubit>(context);
        return Row(
          children: [
            Expanded(
              child: Visibility(
                visible: controller.isVisible2,
                child: Text(
                  'رقم الباركود : ${controller.productBarcode ?? ''}',
                  style: AppStyle.style20Bold(context),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Visibility(
                visible: controller.isVisible,
                child: Text(
                  'تاريخ الإنتهاء :  ${controller.dateTime?.year}-${controller.dateTime?.month}-${controller.dateTime?.day}',
                  style: AppStyle.style20Bold(context),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
