import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:my_markit/core/routers/app_routers.dart';
import 'package:my_markit/core/utils/markting_app_bar.dart';
import 'package:my_markit/core/widgets/custom_float_action_button.dart';

import 'package:my_markit/featuers/debts/data/clints_rep/clint_repo_im.dart';
import 'package:my_markit/featuers/debts/prsentation/view_model/clints_cuibt/clints_cubit.dart';

import 'package:my_markit/featuers/debts/prsentation/widgets/debts_body_view.dart';

class DebtsView extends StatelessWidget {
  const DebtsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClintsCubit(ClintRepoIm())..getClints(),
      child: BlocBuilder<ClintsCubit, ClintsState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: CustomFloatActionButton(
              onPressed: () async {
                GoRouter.of(context)
                    .pushNamed(AppRouters.addClintView, extra: context);
              },
            ),
            appBar: appBar(context, title: 'الــديون'),
            body: const DebtsBodyView(),
          );
        },
      ),
    );
  }
}
