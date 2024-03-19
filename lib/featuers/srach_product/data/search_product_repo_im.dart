import 'package:dartz/dartz.dart';
import 'package:my_markit/core/failure_class.dart';
import 'package:my_markit/core/sql_helper.dart';
import 'package:my_markit/featuers/add_product/data/product_model.dart';
import 'package:my_markit/featuers/srach_product/data/search_product_repo.dart';

class SearchProductRepoIm implements SearchProductRepo {
  @override
  Future<Either<Failure, List<ProductModel>>> searchPRoductByBarcode(
      {required String barcode}) async {
    try {
      var response = await SqlHeper.readdata(
          'select * from products where product_barcode=$barcode');

      List<ProductModel> product = [];

      for (var item in response) {
        product.add(ProductModel.fromJson(item));
      }

      if (product.isEmpty) {
        return left(Failure('لايوجد منتج '));
      } else {
        return right(product);
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> searchPRoductByName(
      {required String name}) async {
    try {
      var response = await SqlHeper.readdata(
          "select * from products where product_name LIKE '%$name%'");

      List<ProductModel> product = [];

      for (var item in response) {
        product.add(ProductModel.fromJson(item));
      }

      if (product.isEmpty) {
        return left(Failure('لايوجد منتج '));
      } else {
        return right(product);
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, dynamic>> deleteProduct({required int id}) async{

    try {
      var response=await SqlHeper.deletdata('delete from products where product_id=$id');

    if(response>0){
      return right(true);
    }
    else{
      return left(Failure('تعذر الــحذف'));
    }
    } catch (_) {
      return left(Failure('تعذر الــحذف'));
      
    }


   

  }
}
