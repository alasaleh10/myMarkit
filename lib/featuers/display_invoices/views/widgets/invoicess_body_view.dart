import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_markit/featuers/display_invoices/views/widgets/invoice_type_row.dart';
import 'package:my_markit/featuers/display_invoices/views/widgets/invoicess_home_page_view.dart';

class InvoicessBodyView extends StatelessWidget {
  const InvoicessBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          InvoiceTypeRow(),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          InvoicessHomePageView(),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
        ],
      ),
    );
  }
}
