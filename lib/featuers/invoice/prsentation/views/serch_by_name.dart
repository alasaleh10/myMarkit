import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_markit/core/widgets/custom_text_form.dart';
import 'package:my_markit/featuers/invoice/prsentation/manger/invoice_cubit/invoice_cubit.dart';
import 'package:my_markit/featuers/invoice/prsentation/widgets/custom_grid_builder.dart';

class SearchByName extends StatelessWidget {
  const SearchByName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFiald(
            onChanged: (value) {
              BlocProvider.of<InvoiceCubit>(context)
                  .getProductByName(name: value!);
            },
            hintText: 'بحث بالإسم',
            icon: FontAwesomeIcons.searchengin),
        const SizedBox(height: 8),
        const Expanded(
          child: CustomGridBuilder(),
        )
      ],
    );
  }
}
