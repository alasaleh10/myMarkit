import 'package:dartz/dartz.dart';
import 'package:my_markit/core/failure_class.dart';
import 'package:my_markit/core/sql_helper.dart';

import 'package:my_markit/featuers/srach_product/data/product_action_repo.dart';

class ProductActionRepIm implements ProductActionRep {
  @override
  Future<Either<Failure, dynamic>> editeProduct(
      {required Map<String, dynamic> productModel, required int id}) async {
    try {
      var response = await SqlHeper.updateData(
          table: 'products', data: productModel, where: ' product_id=$id');
      if (response > 0) {
        return right(true);
      } else {
        return left(Failure('فشلت العملية'));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
