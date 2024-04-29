import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/featuers/display_invoices/data/invoicess_repo.dart';
import 'package:my_markit/featuers/display_invoices/view_model/create_invoice_pdf.dart';

part 'display_invoicess_state.dart';

class DisplayInvoicessCubit extends Cubit<DisplayInvoicessState> {
  final InvoicsessRepo invoicsessRepo;
  DisplayInvoicessCubit(this.invoicsessRepo) : super(DisplayInvoicessInitial());
  File? file;
  void getInvoice({required int invoiceNumbder}) async {
    emit(DisplayInvoicessLoading());
    var response =
        await invoicsessRepo.displayInvoice(invoiceNumbder: invoiceNumbder);
    response.fold((failure) {
      emit(DisplayInvoicessFailure(errorMessage: failure.errorMessage));
    }, (invoice) async {
      // emit(DisplayInvoicessSucsess1());
      file = await createInvoicePdf(items: invoice);
      emit(DisplayInvoicessSucsess(file: file!));


    });
  }
}
