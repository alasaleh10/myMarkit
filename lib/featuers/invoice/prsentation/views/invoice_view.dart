import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/core/utils/markting_app_bar.dart';
import 'package:my_markit/featuers/invoice/data/invoice_repo_im.dart';
import 'package:my_markit/featuers/invoice/prsentation/manger/invoice_cubit/invoice_cubit.dart';
import 'package:my_markit/featuers/invoice/prsentation/widgets/custom_bottom_bar.dart';
import 'package:my_markit/featuers/invoice/prsentation/widgets/invoice_body_view.dart';

class InvoiceView extends StatelessWidget {
  const InvoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvoiceCubit(InvoiceRepoIm()),
      child: Scaffold(
        bottomNavigationBar: const CustomInvoiceBottomBar(),
        appBar: appBar(context, title: 'إضـافة فـاتورة'),
        body: const InvoiceBodyView(),
      ),
    );
  }
}
