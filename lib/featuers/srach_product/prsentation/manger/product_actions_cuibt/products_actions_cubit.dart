import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/featuers/add_product/data/product_model.dart';
import 'package:my_markit/featuers/srach_product/data/product_action_repo.dart';

part 'products_actions_state.dart';

class ProductsActionsCubit extends Cubit<ProductsActionsState> {
  final ProductActionRep productActionRep;
  ProductsActionsCubit(this.productActionRep) : super(ProductsActionsInitial());
  DateTime? date;
  String? barcode;
  late ProductModel productModel;
  final key = GlobalKey<FormState>();
  final name = TextEditingController();
  final price = TextEditingController();
  final count = TextEditingController();
  void getData({required ProductModel productModel}) {
    this.productModel = productModel;
    name.text = productModel.productName!;
    price.text = productModel.productPrice!;
    count.text = productModel.productCount!;
    barcode = productModel.productBarcode!;
    date = DateTime.parse(productModel.productFinishDate!);
  }

  void changeDate({required DateTime date}) {
    this.date = date;
    emit(ProductsActionsInitial());
  }

  void editeProduct() async {
    if (key.currentState!.validate()) {
      Map<String, dynamic> data = {
        'product_name': name.text,
        'product_price': price.text,
        'product_count': count.text,
        'product_finish_date': date.toString()
      };

      var response = await productActionRep.editeProduct(
          productModel: data, id: productModel.productId!.toInt());
      response.fold((failure) {
        emit(ProductsActionsFailure(errorMessage: failure.errorMessage));
      }, (sucsess) {
        emit(ProductsActionsSucsess2());
      });
    }
  }
}
