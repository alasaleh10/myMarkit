import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/featuers/debts/data/clints_rep/clint_repo.dart';
part 'delete_clint_state.dart';

class DeleteClintCubit extends Cubit<DeleteClintState> {
  final ClintRepo clintRepo;
  DeleteClintCubit(this.clintRepo) : super(DeleteClintInitial());

  void getClintPrice({required int id}) async {
    var response = await clintRepo.getClintSum(id: id);

    response.fold((failure) {
      emit(DeleteClintFailure(errorMessage: failure.errorMessage));
    }, (totalPrice) async {
      var res2 = await clintRepo.getClintSum(id: id);
      res2.fold((failure) {
        emit(DeleteClintFailure(errorMessage: failure.errorMessage));
      }, (r) {
        deleteClint(id: id);
      });
    });
  }

  void deleteClint({required int id}) async {
    var response = await clintRepo.deleteClint(id: id);
    response.fold((failure) {
      emit(DeleteClintFailure(errorMessage: failure.errorMessage));
    }, (sucsess) {
      emit(DeleteClintSucsess());
    });
  }
}
