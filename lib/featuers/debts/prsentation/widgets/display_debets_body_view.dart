import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/core/widgets/custom_loading.dart';
import 'package:my_markit/core/widgets/error_text.dart';
import 'package:my_markit/featuers/debts/prsentation/view_model/display_debts_cuibt/display_debets_cubit.dart';
import 'package:my_markit/featuers/debts/prsentation/widgets/custom_display_debets_items.dart';
import 'package:my_markit/featuers/debts/prsentation/widgets/title_row.dart';

class DisplayDebetsBodyView extends StatelessWidget {
  final int id;
  final String clintName;
  const DisplayDebetsBodyView({super.key, required this.clintName, required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const RowTitles(),
        const SizedBox(height: 20),
        BlocBuilder<DisplayDebetsCubit, DisplayDebetsState>(
          builder: (context, state) {
            if (state is DisplayDebetsFailure) {
              return Expanded(
                  child: ErrorText(errorMessage: state.errorMessage));
            } else if (state is DisplayDebetsSucsess) {
              return Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.debets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: CustomDisplayDebetsItem(
                          id: id,
                          clintName:clintName ,
                            debetsModel: state.debets[index]));
                  },
                ),
              );
            } else {
              return const Expanded(child: CustomLoading());
            }
          },
        )
      ],
    );
  }
}
