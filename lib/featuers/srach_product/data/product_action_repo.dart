import 'package:dartz/dartz.dart';
import 'package:my_markit/core/failure_class.dart';

abstract class ProductActionRep {
  Future<Either<Failure, dynamic>> editeProduct(
      {required Map<String, dynamic> productModel, required int id});
}
