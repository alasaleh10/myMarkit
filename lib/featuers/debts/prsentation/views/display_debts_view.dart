import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/routers/app_routers.dart';
import 'package:my_markit/core/utils/markting_app_bar.dart';
import 'package:my_markit/core/widgets/custom_float_action_button.dart';
import 'package:my_markit/featuers/debts/data/debets_repo/debts_repi_im.dart';
import 'package:my_markit/featuers/debts/data/models/clint_model.dart';
import 'package:my_markit/featuers/debts/prsentation/view_model/display_debts_cuibt/display_debets_cubit.dart';
import 'package:my_markit/featuers/debts/prsentation/widgets/display_debets_body_view.dart';
import 'package:my_markit/featuers/debts/prsentation/widgets/total_price_debet.dart';

class DisplayDebtsView extends StatelessWidget {
  final ClintModel clintModel;
  const DisplayDebtsView({super.key, required this.clintModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DisplayDebetsCubit(DebetsRepoIm())
        ..getClintDebts(id: clintModel.clintId!.toInt()),
      child: BlocBuilder<DisplayDebetsCubit, DisplayDebetsState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: TotalPriceDebet(
                  clintModel: clintModel,
                    totalPriceDebet:
                        BlocProvider.of<DisplayDebetsCubit>(context)
                            .totalPrice)),
            floatingActionButton: CustomFloatActionButton(onPressed: () {
              GoRouter.of(context).pushNamed(AppRouters.addDebtView,
                  extra: [clintModel, context]);
            }),
            appBar: appBar(context, title: clintModel.clintName!),
            body: DisplayDebetsBodyView(
                clintName: clintModel.clintName!,
                id: clintModel.clintId!.toInt()),
          );
        },
      ),
    );
  }
}
