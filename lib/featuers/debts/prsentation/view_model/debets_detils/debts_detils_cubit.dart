import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/featuers/debts/data/debets_repo/debets_repo.dart';
import 'package:my_markit/featuers/debts/data/models/debets_model.dart';

part 'debts_detils_state.dart';

class DebtsDetilsCubit extends Cubit<DebtsDetilsState> {
  final DebetsRepo debetsRepo;

  DebtsDetilsCubit(this.debetsRepo) : super(DebtsDetilsInitial());
  late DebetsModel debetsModel;
  final key = GlobalKey<FormState>();
  final description = TextEditingController();
  final price = TextEditingController();

  void onInit({required DebetsModel debetsModel}) {
    this.debetsModel = debetsModel;
    description.text = debetsModel.continet!;
    price.text = debetsModel.price!.toString();
  }

  void updateDebet() async {
    if (key.currentState!.validate()) {
      emit(DebtsDetilsLoading());
      var response = await debetsRepo.updateDebet(
          debtId: debetsModel.debtsId!.toInt(),
          discription: description.text,
          price: int.parse(price.text));
      response.fold((failure) {
        emit(DebtsDetilsFailure(errorMessage: failure.errorMessage));
      }, (r) {
        emit(DebtsDetilsSucsess());
      });
    }
  }

  void deleteDebet() async {
    emit(DebtsDetilsLoading());
    var response =
        await debetsRepo.deleteDebet(id: debetsModel.debtsId!.toInt());

    response.fold((failure) {
      emit(DebtsDetilsFailure(errorMessage: failure.errorMessage));
    }, (r) {
      emit(DebtsDetilsSucsess());
    });
  }
}
