import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/core/utils/markting_app_bar.dart';
import 'package:my_markit/featuers/display_invoices/data/invoicess_repo_im.dart';
import 'package:my_markit/featuers/display_invoices/view_model/display_invoicess_cuibt/display_invoicess_cubit.dart';
import 'package:my_markit/featuers/display_invoices/views/widgets/display_invoice_body_view.dart';

class DisplayInvoicessView extends StatelessWidget {
  final int invoiceNumbder;
  const DisplayInvoicessView({super.key, required this.invoiceNumbder});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DisplayInvoicessCubit(InvoicsessRepoIm())
          ..getInvoice(invoiceNumbder: invoiceNumbder),
        child:  Scaffold(
        appBar: appBar(context,title: 'عرض الفاتورة'),
        body: const DisplayInvoicessBodyView(),
        ));
  }
}
