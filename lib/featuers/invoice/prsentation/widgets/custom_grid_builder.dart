import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/core/widgets/custom_loading.dart';
import 'package:my_markit/core/widgets/error_text.dart';
import 'package:my_markit/featuers/invoice/prsentation/manger/invoice_cubit/invoice_cubit.dart';

import 'package:my_markit/featuers/invoice/prsentation/widgets/custom_grid_view_item.dart';

class CustomGridBuilder extends StatelessWidget {
  const CustomGridBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceCubit, InvoiceState>(
      builder: (context, state) {
        if (state is InvoiceFailure) {
          return ErrorText(errorMessage: state.errorMessage);
        } else if (state is InvoiceSucsess) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                crossAxisCount: 3,
              ),
              itemCount: state.products.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomGridViewItem(
                  productModel: state.products[index],
                );
              });
        } else if (state is InvoiceLoading) {
          return const CustomLoading();
        } else {
          return const ErrorText(errorMessage: 'ابحث عن المنتج');
        }
      },
    );

    // );
  }
}
