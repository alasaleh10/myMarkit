import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/functions/custom_snack_bar.dart';
import 'package:my_markit/core/validation/validation.dart';
import 'package:my_markit/core/widgets/custom_elevated_button.dart';
import 'package:my_markit/core/widgets/custom_text_form.dart';
import 'package:my_markit/featuers/debts/prsentation/view_model/add_clint_cuibt/add_clint_cubit.dart';
import 'package:my_markit/featuers/debts/prsentation/view_model/clints_cuibt/clints_cubit.dart';

class AddClintBodyView extends StatelessWidget {
  final BuildContext context2;
  const AddClintBodyView({super.key, required this.context2});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<AddClintCubit>(context);
    return BlocConsumer<AddClintCubit, AddClintState>(
      listener: (context, state) {
        if (state is AddClintFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(customSnackBar(context, title: state.errorMessage));
        } else if (state is AddClintSucsess2) {
          controller.clintName.clear();
          controller.clintPhone.clear();
          context.pop();
          BlocProvider.of<ClintsCubit>(context2).getClints();
          // controller.getClints();
          ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(context, title: 'تمت الإضافة بنجاح'));
        }
      },
      builder: (context, state) {
        return Form(
          key: controller.key,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 30),
                CustomTextFormFiald(
                    controller: controller.clintName,
                    isValidator: true,
                    validator: (value) {
                      return validation(value!, 'caintName');
                    },
                    hintText: 'إســم العــميل',
                    icon: FontAwesomeIcons.user),
                CustomTextFormFiald(
                    controller: controller.clintPhone,
                    isValidator: true,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      return validation(value!, 'phone');
                    },
                    hintText: 'رقــم الجـوال',
                    icon: FontAwesomeIcons.phone),
                const SizedBox(height: 30),
                CustomElevatedButton(
                    title: 'إضــافة',
                    onPressed: () {
                      controller.addClint();
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
