import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/core/utils/markting_app_bar.dart';
import 'package:my_markit/featuers/display_invoices/view_model/invoicess_home_cuibt/invoicess_home_cubit.dart';
import 'package:my_markit/featuers/display_invoices/views/widgets/invoicess_body_view.dart';

class InvoicessView extends StatelessWidget {
  const InvoicessView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvoicessHomeCubit(),
      child: Scaffold(
        appBar: appBar(context, title: 'عــرض الفواتير'),
        body: const InvoicessBodyView(),
      ),
    );
  }
}
