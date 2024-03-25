import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/functions/custom_snack_bar.dart';
import 'package:my_markit/core/utils/app_styls.dart';
import 'package:my_markit/core/widgets/custom_elevated_button.dart';
import 'package:my_markit/featuers/debts/data/clints_rep/clint_repo_im.dart';
import 'package:my_markit/featuers/debts/data/models/clint_model.dart';
import 'package:my_markit/featuers/debts/prsentation/view_model/clints_cuibt/clints_cubit.dart';
import 'package:my_markit/featuers/debts/prsentation/view_model/delete_clint/delete_clint_cubit.dart';

class DeleteClintDialog extends StatelessWidget {
  final ClintModel clintModel;
  final BuildContext context2;
  const DeleteClintDialog(
      {super.key, required this.context2, required this.clintModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteClintCubit(ClintRepoIm()),
      child: AlertDialog.adaptive(
        icon: BlocConsumer<DeleteClintCubit, DeleteClintState>(
          listener: (context, state) {
            if (state is DeleteClintFailure) {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                  customSnackBar(context, title: state.errorMessage));
            } else if (state is DeleteClintSucsess) {
              context.pop();
              BlocProvider.of<ClintsCubit>(context2).getClints();
              ScaffoldMessenger.of(context)
                  .showSnackBar(customSnackBar(context, title: 'تـم الحذف'));
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Text(
                  'هـل تود حــذف ${clintModel.clintName!} ؟',
                  style: AppStyle.style19Regular(context),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                          title: 'إالــغاء',
                          onPressed: () {
                            context.pop();
                          }),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomElevatedButton(
                          title: 'حــذف',
                          onPressed: () {
                            BlocProvider.of<DeleteClintCubit>(context)
                                .getClintPrice(id: clintModel.clintId!.toInt());
                          }),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
