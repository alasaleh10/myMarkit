import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/featuers/debts/data/debets_repo/debets_repo.dart';

part 'add_debet_state.dart';

class AddDebetCubit extends Cubit<AddDebetState> {
  final DebetsRepo debetsRepo;

  AddDebetCubit(
    this.debetsRepo,
  ) : super(AddDebetInitial());

  final key = GlobalKey<FormState>();
  final discription = TextEditingController();
  final price = TextEditingController();

  void addDebet({required int id}) async {
    if (key.currentState!.validate()) {
      emit(AddDebetLoading());
      var response = await debetsRepo.addDebts(
          id: id, discription: discription.text, price: int.parse(price.text));

      response.fold((failure) {
        emit(AddDebetFailure(errorMessage: failure.errorMessage));
      }, (r) {
        emit(AddDebetSucsess());
      });
    }
  }
}
