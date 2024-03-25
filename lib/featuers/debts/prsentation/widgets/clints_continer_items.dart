import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/routers/app_routers.dart';

import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_styls.dart';
import 'package:my_markit/featuers/debts/data/models/clint_model.dart';
import 'package:my_markit/featuers/debts/prsentation/view_model/clints_cuibt/clints_cubit.dart';
import 'package:my_markit/featuers/debts/prsentation/widgets/delete_clint_dialog.dart';

class ClintContinerItem extends StatelessWidget {
  final ClintModel clintModel;
  const ClintContinerItem({super.key, required this.clintModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushNamed(AppRouters.displayDebtsView,
                      extra: clintModel);
                },
                child: Text(
                  clintModel.clintName!,
                  style: AppStyle.style20Bold(context),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const Spacer(),
              BlocListener<ClintsCubit, ClintsState>(
                listener: (context, state) {
                  if (state is ClintsSucsess2) {
                    BlocProvider.of<ClintsCubit>(context).getClints();
                  }
                },
                child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => DeleteClintDialog(
                            clintModel: clintModel, context2: context));
                  },
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: AppColors.kPrimaryColor,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
        ),
        const Divider(
          color: AppColors.kPrimaryColor,
        )
      ],
    );
  }
}
