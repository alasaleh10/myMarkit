import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/routers/app_routers.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_styls.dart';
import 'package:my_markit/featuers/display_invoices/data/models/invoice_clint_model.dart';

import 'package:my_markit/featuers/display_invoices/views/widgets/delete_invoive_continer.dart';

class InvoicessClintsNames extends StatelessWidget {
  final InvoiveClintModel invoiveClintModel;
  const InvoicessClintsNames({
    super.key,
    required this.invoiveClintModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
            onTap: () {
              GoRouter.of(context).pushNamed(AppRouters.displayInvoicessView,
                  extra: invoiveClintModel.invoiceNumber!.toInt());
            },
            dense: true,
            title: Text(
              '${invoiveClintModel.invoicePrice}ر.ي',
              style: AppStyle.style19Regular(context),
            ),
            leading: Text(
              invoiveClintModel.clintName!,
              style: AppStyle.style25Reqular(context),
            ),
            trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => DeleteClintInvoiceContiner(
                      context2: context,
                      invoiveClintModel: invoiveClintModel,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: AppColors.kPrimaryColor,
                ))),
        const Divider(
          color: AppColors.kPrimaryColor,
        )
      ],
    );
  }
}
