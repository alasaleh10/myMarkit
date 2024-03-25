import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/featuers/add_product/data/product_model.dart';
import 'package:my_markit/featuers/invoice/data/invoice_model.dart';
import 'package:my_markit/featuers/invoice/data/invoice_repo.dart';
part 'invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  final InvoiceRepo invoiceRepo;
  InvoiceCubit(this.invoiceRepo) : super(InvoiceInitial());
  List<InvoiceModel> invoice = [];
  int price = 0;
  var productCount = TextEditingController(text: 1.toString());

  PageController pageController = PageController();

  int index = 0;
  void changePage({required int index}) {
    this.index = index;
    pageController.animateToPage(this.index,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
    emit(InvoiceInitial());
  }

  Future<void> getProductByBarcode({required String barcode}) async {
    var response = await invoiceRepo.getProductByBarcode(barcode: barcode);
    response.fold((failure) {
      emit(InvoiceFailure(errorMessage: failure.errorMessage));
    }, (products) {
      emit(InvoiceSucsess(products: products));
    });
  }

  Future<void> getProductByName({required String name}) async {
    var response = await invoiceRepo.getProductByName(name: name);
    response.fold((failure) {
      emit(InvoiceFailure(errorMessage: failure.errorMessage));
    }, (products) {
      emit(InvoiceSucsess(products: products));
    });
  }

  void editPrice({required int price}) {
    this.price = price;
    productCount.text = '1';

    emit(InvoiceInitial());
  }

  void addToInvoice({required InvoiceModel invoiceModel}) {
    invoice.add(invoiceModel);
    emit(InvoiceInitial());
  }

  void confirmInvoice() async {
    if (invoice.isEmpty) return;
    emit(InvoiceLoading2());

    for (var i = 0; i < invoiveLength(); i++) {
      var response = await invoiceRepo.getProduct(id: invoice[i].id);

      response.fold((failure) {
        emit(InvoiceFailure2(errorMessage: failure.errorMessage));
      }, (product) async {
        int oldCount = int.parse(product[0].productCount!);
        int count = invoice[i].count;
        int newCount = oldCount - count;
        var newReso = await invoiceRepo.confirmInvoice(
            id: invoice[i].id, newCount: newCount.toString());
        newReso.fold((failure) {
          emit(InvoiceFailure2(errorMessage: failure.errorMessage));
        }, (sucsess) {
          emit(InvoiceSucsess2());
        });
      });
    }
  }

  void deleteItem({required int index, required int productPrice}) {
    invoice.removeAt(index);
    price = price - productPrice;
    emit(InvoiceInitial());
  }

  void clearData() {
    price = 0;
    invoice.clear();
    emit(InvoiceInitial());
  }

  void editProductList(
      {required int index, required List<InvoiceModel> invoiceModel}) {
    invoice.removeAt(index);
    invoice.insertAll(index, invoiceModel);
    emit(InvoiceInitial());
  }

  @override
  Future<void> close() {
    productCount.dispose();
    pageController.dispose();
    return super.close();
  }

  int invoiveLength() {
    if (invoice.length == 1) {
      return 1;
    } else {
      return invoice.length - 1;
    }
  }
}
