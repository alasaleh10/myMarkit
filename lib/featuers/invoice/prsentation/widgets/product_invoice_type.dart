import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/featuers/invoice/prsentation/manger/invoice_cubit/invoice_cubit.dart';
import 'package:my_markit/featuers/srach_product/prsentation/widgets/type_search_continer.dart';

class ProductInvoiveType extends StatelessWidget {
  const ProductInvoiveType({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<InvoiceCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: BlocBuilder<InvoiceCubit, InvoiceState>(
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                  child: TypeSearchContiner(
                isActive: controller.index == 0 ? true : false,
                onTap: () {
                  controller.changePage(index: 0);
                },
                title: 'بحث بالبـاركـود',
              )),
              const SizedBox(width: 10),
              Expanded(
                  child: TypeSearchContiner(
                isActive: controller.index == 1 ? true : false,
                onTap: () {
                  controller.changePage(index: 1);
                },
                title: 'بـحث بالإسـم',
              ))
            ],
          );
        },
      ),
    );
  }
}
