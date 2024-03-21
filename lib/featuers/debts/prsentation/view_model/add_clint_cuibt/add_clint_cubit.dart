import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/featuers/debts/data/clints_rep/clint_repo.dart';
import 'package:my_markit/featuers/debts/data/models/clint_model.dart';

part 'add_clint_state.dart';

class AddClintCubit extends Cubit<AddClintState> {
  final ClintRepo clintRepo;
  AddClintCubit(this.clintRepo) : super(AddClintInitial());
  final key = GlobalKey<FormState>();
  final clintName = TextEditingController();
  final clintPhone = TextEditingController();

  void addClint() async {
    if (key.currentState!.validate()) {
      emit(AddClintLoading());
      var response = await clintRepo.addClint(
          name: clintName.text, phone: clintPhone.text);
      response.fold((failure) {
        emit(AddClintFailure(errorMessage: failure.errorMessage));
      }, (sucsess) {
        emit(AddClintSucsess2());
      });
    }
  }
}
