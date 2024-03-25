import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/functions/custom_snack_bar.dart';
import 'package:my_markit/core/validation/validation.dart';
import 'package:my_markit/core/widgets/custom_elevated_button.dart';
import 'package:my_markit/core/widgets/custom_loading.dart';
import 'package:my_markit/core/widgets/custom_text_form.dart';
import 'package:my_markit/featuers/debts/prsentation/view_model/debets_detils/debts_detils_cubit.dart';
import 'package:my_markit/featuers/debts/prsentation/view_model/display_debts_cuibt/display_debets_cubit.dart';

class DebetsDetilsBodyView extends StatelessWidget {
  final int id;
  final BuildContext context2;
  const DebetsDetilsBodyView(
      {super.key, required this.context2, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DebtsDetilsCubit, DebtsDetilsState>(
      listener: (context, state) {
        if (state is DebtsDetilsFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(customSnackBar(context, title: state.errorMessage));
        } else if (state is DebtsDetilsSucsess) {
          BlocProvider.of<DisplayDebetsCubit>(context2).getClintDebts(id: id);
          context.pop();
          ScaffoldMessenger.of(context)
              .showSnackBar(customSnackBar(context, title: 'تم بنجاح'));
        }
      },
      builder: (context, state) {
        final controller = BlocProvider.of<DebtsDetilsCubit>(context);
        return Form(
          key: controller.key,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            children: [
              CustomTextFormFiald(
                  maxLines: 3,
                  isValidator: true,
                  validator: (value) {
                    return validation(value!, 'discription');
                  },
                  controller: controller.description,
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
              state is DebtsDetilsLoading
                  ? const CustomLoading()
                  : Row(
                      children: [
                        Expanded(
                            child: CustomElevatedButton(
                          title: 'تــعديل',
                          onPressed: () {
                            controller.updateDebet();
                          },
                        )),
                        const SizedBox(width: 15),
                        Expanded(
                            child: CustomElevatedButton(
                          title: 'حــذف',
                          onPressed: () {
                            controller.deleteDebet();
                          },
                        ))
                      ],
                    )
            ],
          ),
        );
      },
    );
  }
}
