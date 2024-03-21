import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/core/utils/markting_app_bar.dart';
import 'package:my_markit/featuers/debts/data/clints_rep/clint_repo_im.dart';
import 'package:my_markit/featuers/debts/prsentation/view_model/add_clint_cuibt/add_clint_cubit.dart';
import 'package:my_markit/featuers/debts/prsentation/widgets/add_clint_body_view.dart';

class AddClintView extends StatelessWidget {
  final BuildContext context2;

  const AddClintView({super.key, required this.context2});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddClintCubit(ClintRepoIm()),
      child: Scaffold(
        appBar: appBar(context, title: 'إضافة عميل'),
        body: AddClintBodyView(
          context2: context2,
        ),
      ),
    );
  }
}
