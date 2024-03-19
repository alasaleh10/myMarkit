import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/functions/barcode_sound.dart';
import 'package:my_markit/core/routers/app_routers.dart';

import 'package:my_markit/core/widgets/custom_elevated_button.dart';
import 'package:my_markit/core/widgets/custom_text_form.dart';
import 'package:my_markit/featuers/invoice/prsentation/manger/invoice_cubit/invoice_cubit.dart';
import 'package:my_markit/featuers/invoice/prsentation/widgets/custom_grid_builder.dart';

class SearchByBarcode extends StatelessWidget {
  const SearchByBarcode({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<InvoiceCubit>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
                child: CustomElevatedButton(
                    title: 'إضافـة الباركود',
                    onPressed: () async {
                      var res = await GoRouter.of(context)
                          .pushNamed(AppRouters.barcode);
                      if (res.toString().length > 3) {
                        barcodeSound();

                        controller.getProductByBarcode(barcode: res.toString());
                      }
                    })),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: CustomTextFormFiald(
              onChanged: (value) {
                controller.getProductByBarcode(barcode: value!);
              },
              hintText: 'بحث بالباركود',
              icon: FontAwesomeIcons.barcode,
            ))
          ],
        ),
        const SizedBox(height: 8),
        const Expanded(
          child: CustomGridBuilder(),
        )
      ],
    );
  }
}
