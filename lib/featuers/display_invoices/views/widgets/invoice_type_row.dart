import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/featuers/display_invoices/view_model/invoicess_home_cuibt/invoicess_home_cubit.dart';
import 'package:my_markit/featuers/srach_product/prsentation/widgets/type_search_continer.dart';

class InvoiceTypeRow extends StatelessWidget {
  const InvoiceTypeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: BlocBuilder<InvoicessHomeCubit, InvoicessHomeState>(
          builder: (context, state) {
            var controller = BlocProvider.of<InvoicessHomeCubit>(context);
            return Row(
              children: [
                Expanded(
                  child: TypeSearchContiner(
                    isActive: controller.index == 0 ? true : false,
                    onTap: () {
                      controller.goPage(index: 0);
                    },
                    title: 'نــقدا',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TypeSearchContiner(
                    isActive: controller.index == 1 ? true : false,
                    onTap: () {
                      controller.goPage(index: 1);
                    },
                    title: 'اجـــلا',
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
