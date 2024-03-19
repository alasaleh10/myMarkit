import 'package:dartz/dartz.dart';
import 'package:my_markit/core/failure_class.dart';

abstract class AddProductRepo {
  Future<Either<Failure, dynamic>> addProduct(
      {required String productName,
      required String productPrice,
      required String productCount,
      required String productBarcode,
      required String finishTime});
}
