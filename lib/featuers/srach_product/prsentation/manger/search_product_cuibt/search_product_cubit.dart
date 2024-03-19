import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/featuers/add_product/data/product_model.dart';
import 'package:my_markit/featuers/srach_product/data/search_product_repo.dart';
part 'search_product_state.dart';

class SearchProductCubit extends Cubit<SearchProductState> {
  final SearchProductRepo searchProductRepo;
  SearchProductCubit(this.searchProductRepo) : super(SearchProductInitial());

  PageController pageController = PageController();

  int pageIndex = 0;
  String? name;
  void changePage({required int index}) {
    pageIndex = index;
    pageController.animateToPage(pageIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.linearToEaseOut);
    emit(SearchProductInitial());
  }

  Future<void> searchByBarcode({required String barcode}) async {
    var response =
        await searchProductRepo.searchPRoductByBarcode(barcode: barcode);

    response.fold((failure) {
      emit(SearchProductFailure(errorMessage: failure.errorMessage));
    }, (prodcust) {
      emit(SearchProductSucsess(prodcust: prodcust));
    });
  }

  Future<void> searchByBName({required String name}) async {
    var response = await searchProductRepo.searchPRoductByName(name: name);

    response.fold((failure) {
      emit(SearchProductFailure(errorMessage: failure.errorMessage));
    }, (prodcust) {
      emit(SearchProductSucsess(prodcust: prodcust));
    });
  }

  Future<void> deleteProduct(
      {required int id,
      required bool isBarcode,
      required String barcode,
      required String name}) async {
    var response = await searchProductRepo.deleteProduct(id: id);

    response.fold((l) => null, (r) {
      if (isBarcode) {
        searchByBarcode(barcode: barcode);
      } else {
        searchByBName(name: name);
      }
    });
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
