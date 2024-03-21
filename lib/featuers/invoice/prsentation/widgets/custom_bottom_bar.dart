import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/core/functions/custom_snack_bar.dart';
import 'package:my_markit/core/functions/decimal_numbers.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_styls.dart';
import 'package:my_markit/core/widgets/custom_elevated_button.dart';
import 'package:my_markit/featuers/invoice/prsentation/manger/invoice_cubit/invoice_cubit.dart';

class CustomInvoiceBottomBar extends StatelessWidget {
  const CustomInvoiceBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: BlocConsumer<InvoiceCubit, InvoiceState>(
        listener: (context, state) {
          if (state is InvoiceFailure2) {
            ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(context, title: state.errorMessage));
          } else if (state is InvoiceSucsess2) {
            ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(context, title: 'تمت العميلة بنجاح'));
            BlocProvider.of<InvoiceCubit>(context).clearData();
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.kPrimaryColor),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'الإجــمالي',
                  style: AppStyle.style20Bold(context),
                )),
                Expanded(
                    child: Text(
                  '${decimalNumer(price: BlocProvider.of<InvoiceCubit>(context).price)}ر.ي',
                  style: AppStyle.style20Bold(context),
                )),
                Expanded(
                  child: CustomElevatedButton(
                      title: 'تــأكيد',
                      onPressed: () {
                        BlocProvider.of<InvoiceCubit>(context).confirmInvoice();
                      }),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
