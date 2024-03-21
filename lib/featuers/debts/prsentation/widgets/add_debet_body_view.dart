import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/functions/custom_snack_bar.dart';
import 'package:my_markit/core/validation/validation.dart';
import 'package:my_markit/core/widgets/custom_elevated_button.dart';
import 'package:my_markit/core/widgets/custom_loading.dart';
import 'package:my_markit/core/widgets/custom_text_form.dart';
import 'package:my_markit/featuers/debts/data/models/clint_model.dart';
import 'package:my_markit/featuers/debts/prsentation/view_model/add_debets_cuibt/add_debet_cubit.dart';
import 'package:my_markit/featuers/debts/prsentation/view_model/display_debts_cuibt/display_debets_cubit.dart';

class AddDebetBodyView extends StatelessWidget {
  final BuildContext context2;
  final ClintModel clintModel;
  const AddDebetBodyView(
      {super.key, required this.clintModel, required this.context2});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<AddDebetCubit>(context);
    return Form(
      key: controller.key,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            CustomTextFormFiald(
                enable: false,
                controller: TextEditingController(text: clintModel.clintName),
                hintText: 'إسـم العميل',
                icon: FontAwesomeIcons.user),
            CustomTextFormFiald(
                isValidator: true,
                validator: (value) {
                  return validation(value!, 'discription');
                },
                controller: controller.discription,
                hintText: 'الــوصف',
                icon: FontAwesomeIcons.fileInvoice),
            CustomTextFormFiald(
                isValidator: true,
                validator: (value) {
                  return validation(value!, 'price');
                },
                keyboardType: TextInputType.number,
                controller: controller.price,
                hintText: 'الــسعر',
                icon: FontAwesomeIcons.moneyCheck),
            const SizedBox(height: 30),
            BlocConsumer<AddDebetCubit, AddDebetState>(
              listener: (context, state) {
                if (state is AddDebetFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      customSnackBar(context, title: state.errorMessage));
                } else if (state is AddDebetSucsess) {
                  BlocProvider.of<DisplayDebetsCubit>(context2)
                      .getClintDebts(id: clintModel.clintId!.toInt());
                  ScaffoldMessenger.of(context).showSnackBar(
                      customSnackBar(context, title: 'تـمت الإضـافة'));
                  context.pop();
                }
              },
              builder: (context, state) {
                if (state is AddDebetLoading) {
                  return const CustomLoading();
                } else {
                  return CustomElevatedButton(
                    title: 'إضــافة',
                    onPressed: () {
                      controller.addDebet(id: clintModel.clintId!.toInt());
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
