import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/utils/app_styls.dart';
import 'package:my_markit/core/widgets/custom_elevated_button.dart';
import 'package:my_markit/featuers/invoice/prsentation/manger/invoice_cubit/invoice_cubit.dart';
import 'package:my_markit/featuers/invoice/prsentation/widgets/add_invoice_continer.dart';

class CreateInvoiceAlert extends StatelessWidget {
  final BuildContext context2;
  const CreateInvoiceAlert({super.key, required this.context2});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Column(
        children: [
          Text(
            'هل تود إنــشاء فاتورة البيع؟',
            style: AppStyle.style19Regular(context),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                  child: CustomElevatedButton(
                title: 'إلــغاء',
                onPressed: () {
                  BlocProvider.of<InvoiceCubit>(context2).clearData();
                  context.pop();
                },
              )),
              const SizedBox(width: 10),
              Expanded(
                  child: CustomElevatedButton(
                      title: 'نـعم',
                      onPressed: () {
                        context.pop();
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (_) =>
                                AddInvoiceContiner(context2: context2));
                      }))
            ],
          )
        ],
      ),
    );
  }
}
