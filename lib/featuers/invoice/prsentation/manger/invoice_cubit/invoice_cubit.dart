import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/routers/app_routers.dart';

import 'package:my_markit/featuers/add_product/data/product_model.dart';
import 'package:my_markit/featuers/invoice/data/invoice_model.dart';
import 'package:my_markit/featuers/invoice/data/invoice_repo.dart';
import 'package:my_markit/featuers/pdf/ceate_pdf.dart';
part 'invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  final InvoiceRepo invoiceRepo;
  final BuildContext context;
  InvoiceCubit(this.invoiceRepo, this.context) : super(InvoiceInitial());
  List<InvoiceModel> invoice = [];
  final key = GlobalKey<FormState>();
  int price = 0;
  int? invoiceNumber;
  var productCount = TextEditingController(text: 1.toString());
  var clintName = TextEditingController();
  int? invoiceType;
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

    try {
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
          }, (sucsess) async {
            // await addInvoice(context);

            emit(InvoiceSucsess2());
          });
        });
      }
    } catch (_) {}
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

  void addInvoiceToData() async {
    var response = await invoiceRepo.addInvoice(
      clintName: clintName.text,
      invoiceType: invoiceType!,
      invoicePrice: price,
    );
    response.fold((failure) {}, (sucsess) async {
      for (var item in invoice) {
        var res = await invoiceRepo.addItemsToInvoice(
            productName: item.productName,
            ontPrice: item.onePrice,
            count: item.count);
        res.fold((failue) {
          debugPrint(failue.errorMessage);
          return;
        }, (invoiceNumber1) async {
          invoiceNumber = invoiceNumber1;
          await addInvoice(context);
          emit(InvoiceSucsess3());

          return;
        });
      }
    });

    // invoice.clear();
    // addInvoice(context);
  }

  File? file;
  Future<void> addInvoice(BuildContext context) async {
    if (key.currentState!.validate()) {
      file = await createPdf(context,
          clintName: clintName.text,
          invoicetype: invoiceType!,
          invoice: invoice,
          invoiceNumber: invoiceNumber!);

      invoice.clear();
      price = 0;
      clintName.clear();

      // ignore: use_build_context_synchronously
      GoRouter.of(context).pop();

      // ignore: use_build_context_synchronously
      GoRouter.of(context).pushNamed(AppRouters.previewPdView, extra: file);
    }
    emit(InvoiceInitial());
  }

  void setInvoiceType({required int invoiceType}) {
    this.invoiceType = invoiceType;

    emit(InvoiceSucsess3());
  }
}
