import 'package:flutter/material.dart';
import 'package:my_markit/core/utils/markting_app_bar.dart';
import 'package:my_markit/featuers/invoice/prsentation/widgets/display_invoice_body_view.dart';

class DisplayInvoiceView extends StatelessWidget {
  const DisplayInvoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: 'عـرض الفواتــير'),
      body: const DisplayInvoiceBodyView(),
    );
  }
}
