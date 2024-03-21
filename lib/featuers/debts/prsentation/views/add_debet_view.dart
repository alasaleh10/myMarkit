import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/core/utils/markting_app_bar.dart';
import 'package:my_markit/featuers/debts/data/debets_repo/debts_repi_im.dart';

import 'package:my_markit/featuers/debts/prsentation/view_model/add_debets_cuibt/add_debet_cubit.dart';
import 'package:my_markit/featuers/debts/prsentation/widgets/add_debet_body_view.dart';

class AddDebtView extends StatelessWidget {
  final List data;
  const AddDebtView({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddDebetCubit(DebetsRepoIm()),
      child: Scaffold(
        appBar: appBar(context, title: 'إضـافة ديـن'),
        body: AddDebetBodyView(clintModel: data[0],
        context2: data[1]),
      ),
    );
  }
}
