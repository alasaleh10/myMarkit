import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:my_markit/core/functions/decimal_numbers.dart';
import 'package:my_markit/core/routers/app_routers.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_styls.dart';
import 'package:my_markit/featuers/debts/data/models/debets_model.dart';

class CustomDisplayDebetsItem extends StatelessWidget {
  final int id;
  final String clintName;
  final DebetsModel debetsModel;
  const CustomDisplayDebetsItem(
      {super.key,
      required this.debetsModel,
      required this.clintName,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(AppRouters.debetsDetilsView,
            extra: [context, debetsModel, clintName, id]);
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Text(
                    DateFormat('d-M-yyyy EEEE h:m a')
                        .format(DateTime.parse(debetsModel.createTime!)),
                    style: AppStyle.style19Regular(context),
                  )),
              const SizedBox(width: 10),
              Expanded(
                  flex: 3,
                  child: Text(
                    debetsModel.continet!,
                    style: AppStyle.style20Bold(context),
                  )),
              const SizedBox(width: 10),
              Expanded(
                  child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '${decimalNumer(price: debetsModel.price!.toInt())}ر.ي',
                  style: AppStyle.style20Bold(context),
                ),
              ))
            ],
          ),
          const Divider(color: AppColors.kPrimaryColor),
          const SizedBox(height: 15)
        ],
      ),
    );
  }
}
