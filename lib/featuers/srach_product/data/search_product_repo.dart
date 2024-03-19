import 'package:dartz/dartz.dart';
import 'package:my_markit/core/failure_class.dart';
import 'package:my_markit/featuers/add_product/data/product_model.dart';

abstract class SearchProductRepo {
  Future<Either<Failure,List<ProductModel>>> searchPRoductByBarcode({required String barcode});
  Future<Either<Failure,List<ProductModel>>> searchPRoductByName({required String name});
  Future<Either<Failure,dynamic>> deleteProduct({required int id});

  
}