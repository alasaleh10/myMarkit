import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/featuers/display_invoices/view_model/invoicess_home_cuibt/invoicess_home_cubit.dart';
import 'package:my_markit/featuers/display_invoices/views/cash_invoicess_view.dart';
import 'package:my_markit/featuers/display_invoices/views/postpaid_invoicess_view.dart';

class InvoicessHomePageView extends StatelessWidget {
  const InvoicessHomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
        child: PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: BlocProvider.of<InvoicessHomeCubit>(context).pageController,
      children: const [CashInvoicessView(), PostpaidInvoicessView()],
    ));
  }
}
