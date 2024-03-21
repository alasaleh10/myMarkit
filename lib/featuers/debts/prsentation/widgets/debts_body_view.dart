import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_markit/core/widgets/custom_loading.dart';
import 'package:my_markit/core/widgets/custom_text_form.dart';
import 'package:my_markit/core/widgets/error_text.dart';
import 'package:my_markit/featuers/debts/prsentation/view_model/clints_cuibt/clints_cubit.dart';
import 'package:my_markit/featuers/debts/prsentation/widgets/clints_continer_items.dart';

class DebtsBodyView extends StatelessWidget {
  const DebtsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomTextFormFiald(
              onChanged: (value) {
                BlocProvider.of<ClintsCubit>(context)
                    .getCustomClint(name: value!);
              },
              hintText: 'بحـث عن عميل',
              icon: FontAwesomeIcons.user),
        ),
        const SizedBox(height: 15),
        BlocBuilder<ClintsCubit, ClintsState>(
          builder: (context, state) {
            if (state is ClintsFailure) {
              return Expanded(
                  child: ErrorText(errorMessage: state.errorMessage));
            } else if (state is ClintsSucsess) {
              return Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: state.clints.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: ClintContinerItem(
                        clintModel: state.clints[index],
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Expanded(child: CustomLoading());
            }
          },
        ),
      ],
    );
  }
}
