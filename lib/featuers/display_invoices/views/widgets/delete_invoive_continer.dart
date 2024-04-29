import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:my_markit/core/utils/app_styls.dart';
import 'package:my_markit/core/widgets/custom_elevated_button.dart';
import 'package:my_markit/featuers/display_invoices/data/models/invoice_clint_model.dart';

import 'package:my_markit/featuers/display_invoices/view_model/get_invoicess_cuibt/get_invoicsess_cubit.dart';

class DeleteClintInvoiceContiner extends StatelessWidget {
  final BuildContext context2;
  final InvoiveClintModel invoiveClintModel;
  const DeleteClintInvoiceContiner(
      {super.key, required this.context2, required this.invoiveClintModel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Column(
        children: [
          Text(
            'هل تود حذف ${invoiveClintModel.clintName}؟',
            style: AppStyle.style19Regular(context),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                  child: CustomElevatedButton(
                onPressed: () {
                  context.pop();
                },
                title: 'لا',
              )),
              const SizedBox(width: 15),
              Expanded(
                  child: CustomElevatedButton(
                onPressed: () {
                  BlocProvider.of<GetInvoicsessCubit>(context2).deleteInvoice(
                      id: invoiveClintModel.invoiceId!.toInt(),
                      invoiceNumber: invoiveClintModel.invoiceNumber!.toInt());
                  BlocProvider.of<GetInvoicsessCubit>(context2).getInvoicess(
                      type: invoiveClintModel.invoiceType!.toInt());
                  context.pop();
                },
                title: 'نــعم',
              ))
            ],
          )
        ],
      ),
    );
  }
}
