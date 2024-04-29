import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/featuers/debts/data/clints_rep/clint_repo.dart';
import 'package:my_markit/featuers/debts/data/models/clint_model.dart';

part 'clints_state.dart';

class ClintsCubit extends Cubit<ClintsState> {
  final ClintRepo clintRepo;
  ClintsCubit(this.clintRepo) : super(ClintsInitial());

  void getClints() async {
    emit(ClintsLoading());
    var response = await clintRepo.getClints();
    response.fold((failure) {
      emit(ClintsFailure(errorMessage: failure.errorMessage));
    }, (clints) {
      emit(ClintsSucsess(clints: clints));
    });
  }

  void getCustomClint({required String name}) async {
    emit(ClintsLoading());
    var response = await clintRepo.getCustomClint(name: name);
    response.fold((failure) {
      emit(ClintsFailure(errorMessage: failure.errorMessage));
    }, (clints) {
      emit(ClintsSucsess(clints: clints));
    });
  }
}
