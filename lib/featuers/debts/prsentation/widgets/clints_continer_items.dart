import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/routers/app_routers.dart';

import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_styls.dart';
import 'package:my_markit/featuers/debts/data/models/clint_model.dart';

class ClintContinerItem extends StatelessWidget {
  final ClintModel clintModel;
  const ClintContinerItem({super.key, required this.clintModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .pushNamed(AppRouters.displayDebtsView, extra: clintModel);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 10),
            child: Text(
              clintModel.clintName!,
              style: AppStyle.style20Bold(context),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          const Divider(
            color: AppColors.kPrimaryColor,
          )
        ],
      ),
    );
  }
}
