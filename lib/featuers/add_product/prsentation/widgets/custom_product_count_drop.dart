import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/core/functions/text_form_border.dart';
import 'package:my_markit/core/utils/app_styls.dart';
import 'package:my_markit/featuers/add_product/prsentation/view_model/add_product_cuibt/add_product_cubit.dart';

class CustomProductCountDrop extends StatelessWidget {
  const CustomProductCountDrop({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        onSelected: (value) {
          BlocProvider.of<AddProductCubit>(context)
              .selectCountType(counterType: value!);
        },
        label: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text('نوع الكميه', style: AppStyle.style20Bold(context))),
        textStyle: AppStyle.style20Bold(context),
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: AppStyle.style20Bold(context),
            isDense: true,
            enabledBorder: textFormBorder(),
            border: textFormBorder(),
            disabledBorder: textFormBorder(),
            focusedBorder: textFormBorder()),
        dropdownMenuEntries: const [
          DropdownMenuEntry(value: 1, label: 'درزن'),
          DropdownMenuEntry(value: 2, label: 'حــبة')
        ]);
  }
}
