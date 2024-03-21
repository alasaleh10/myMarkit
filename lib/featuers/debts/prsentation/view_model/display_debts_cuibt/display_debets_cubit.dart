import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/core/sql_helper.dart';
import 'package:my_markit/featuers/debts/data/debets_repo/debets_repo.dart';
import 'package:my_markit/featuers/debts/data/models/debets_model.dart';

part 'display_debets_state.dart';

class DisplayDebetsCubit extends Cubit<DisplayDebetsState> {
  final DebetsRepo debetsRepo;
  DisplayDebetsCubit(this.debetsRepo) : super(DisplayDebetsInitial());
  int totalPrice = 0;
  void getClintDebts({required int id}) async {
    emit(DisplayDebetsLoading());
    var response = await debetsRepo.getClintDebts(id: id);

    response.fold((failure) {
      emit(DisplayDebetsFailure(errorMessage: failure.errorMessage));
    }, (debets) async {
      var resp = await SqlHeper.readdata(
          'SELECT SUM(price) FROM debts WHERE id_clint=$id');
      totalPrice = resp[0]['SUM(price)'];
    
      emit(DisplayDebetsSucsess(debets: debets));
    });
  }
}
