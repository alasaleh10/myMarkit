import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/featuers/display_invoices/data/invoicess_repo.dart';
import 'package:my_markit/featuers/display_invoices/data/models/invoice_clint_model.dart';

part 'get_invoicsess_state.dart';

class GetInvoicsessCubit extends Cubit<GetInvoicsessState> {
  final InvoicsessRepo invoicsessRepo;
  GetInvoicsessCubit(this.invoicsessRepo) : super(GetInvoicsessInitial());

  void getInvoicess({required int type}) async {
    emit(GetInvoicsessLoading());
    var response = await invoicsessRepo.getInvoicess(type: type);

    response.fold((failure) {
      emit(GetInvoicsessFailure(errorMessage: failure.errorMessage));
    }, (invoicess) {
      emit(GetInvoicsessSucsess(invoicess: invoicess));
    });
  }

  void searchClintInvoice({required int type, required String name}) async {
    emit(GetInvoicsessLoading());
    var response =
        await invoicsessRepo.searchClintInvoice(name: name, type: type);

    response.fold((failure) {
      emit(GetInvoicsessFailure(errorMessage: failure.errorMessage));
    }, (invoicess) {
      emit(GetInvoicsessSucsess(invoicess: invoicess));
    });
  }

  void deleteInvoice({required int id, required int invoiceNumber}) async {
    emit(GetInvoicsessLoading());
    var response = await invoicsessRepo.deleteInvoicess(
        id: id, invoiceNumber: invoiceNumber);

    response.fold((failure) {
      // emit(GetInvoicsessFailure(errorMessage: failure.errorMessage));
    }, (invoicess) {
      // emit(GetInvoicsessSucsess2());
    });
  }
}
