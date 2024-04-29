import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/core/utils/markting_app_bar.dart';
import 'package:my_markit/featuers/debts/data/debets_repo/debts_repi_im.dart';
import 'package:my_markit/featuers/debts/prsentation/view_model/debets_detils/debts_detils_cubit.dart';
import 'package:my_markit/featuers/debts/prsentation/widgets/debet_detiles_body_view.dart';

class DebetsDetilsView extends StatelessWidget {
  final List data;
  const DebetsDetilsView({super.key, required this.data});
// context0
//model1
// clintName2
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DebtsDetilsCubit(DebetsRepoIm())..onInit(debetsModel: data[1]),
      child: Scaffold(
        appBar: appBar(context, title: data[2]),
        body: DebetsDetilsBodyView(
          id: data[3],
          context2: data[0],
        ),
      ),
    );
  }
}
