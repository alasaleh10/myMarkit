import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/featuers/add_product/data/add_product_repo.dart';
part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final AddProductRepo addProductRepo;
  AddProductCubit(this.addProductRepo) : super(AddProductInitial());

  final key = GlobalKey<FormState>();
  String? productBarcode;
  int? counterType;
  int counter = 0;

  final productName = TextEditingController();
  final productPrice = TextEditingController();

  DateTime? dateTime;
  bool isVisible = false;
  bool isVisible2 = false;

  void selectCountType({required int counterType}) {
    this.counterType = counterType;
  }

  void selectTime({required DateTime time}) {
    dateTime = time;
    isVisible = true;
    emit(AddProductInitial());
  }
  void selectBarcode({required String barcode}){
    productBarcode=barcode;
      isVisible2 = true;
    emit(AddProductInitial());

  }

  Future<void> addProduct() async {
    if (key.currentState!.validate()) {
      if (productBarcode == null) {
        emit(AddProductFailure(errorMessage: 'الرجاء إضافة الباركود'));
      } else if (counterType == null) {
        emit(AddProductFailure(errorMessage: 'الرجاء إختيار نوع الكمية'));
      } else if (dateTime == null) {
        emit(AddProductFailure(errorMessage: 'الرجاء اختيار تاريخ الانتهاء'));
      } else if (counter == 0) {
        emit(AddProductFailure(errorMessage: 'الرجاء اختيار الكمية'));
      } else {
        await addProducts();
      }
    }
  }

  Future<void> addProducts() async {
    var response = await addProductRepo.addProduct(
        productName: productName.text,
        productPrice: productPrice.text,
        productCount: count().toString(),
        productBarcode: productBarcode!,
        finishTime: dateTime.toString());

    response.fold((failure) {
      emit(AddProductFailure(errorMessage: failure.errorMessage));
    }, (sucsess) {
      emit(AddProductSucsess());
    });
  }

  int count() {
    if (counterType == 1) {
      return (counter * 12);
    } else {
      return counter;
    }
  }

  @override
  Future<void> close() {
  productName.dispose();
  productPrice.dispose();
    return super.close();
  }
}
