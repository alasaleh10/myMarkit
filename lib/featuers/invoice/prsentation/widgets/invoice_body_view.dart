import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_markit/featuers/invoice/prsentation/manger/invoice_cubit/invoice_cubit.dart';
import 'package:my_markit/featuers/invoice/prsentation/views/search_by_barcode.dart';
import 'package:my_markit/featuers/invoice/prsentation/views/serch_by_name.dart';
import 'package:my_markit/featuers/invoice/prsentation/widgets/invoice_product_item.dart';
import 'package:my_markit/featuers/invoice/prsentation/widgets/product_invoice_type.dart';

class InvoiceBodyView extends StatelessWidget {
  const InvoiceBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: ProductInvoiveType()),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height / 2,
              width: double.infinity,
              child: PageView(
                controller:
                    BlocProvider.of<InvoiceCubit>(context).pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [SearchByBarcode(), SearchByName()],
              ),
            ),
          ),
          BlocBuilder<InvoiceCubit, InvoiceState>(
            builder: (context, state) {
              return SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => InvoiceProductItem(
                          index: index,
                          invoiceModel: BlocProvider.of<InvoiceCubit>(context)
                              .invoice[index]),
                      childCount: BlocProvider.of<InvoiceCubit>(context)
                          .invoice
                          .length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      crossAxisCount: 2));
            },
          )
        ],
      ),
    );
  }
}
