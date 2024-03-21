import 'package:dartz/dartz.dart';
import 'package:my_markit/core/failure_class.dart';
import 'package:my_markit/core/sql_helper.dart';

import 'package:my_markit/featuers/add_product/data/add_product_repo.dart';

class AddProductRepoIm implements AddProductRepo {
  @override
  Future<Either<Failure, dynamic>> addProduct(
      {required String productName,
      required String productPrice,
      required String productCount,
      required String productBarcode,
      required String finishTime}) async {
    try {
      List oldProduct = await SqlHeper.readdata(
          'SELECT * FROM products WHERE product_barcode=$productBarcode');
      if (oldProduct.isEmpty) {
        var response = await SqlHeper.addData(table: 'products', data: {
          'product_name': productName,
          'product_count': productCount,
          'product_price': productPrice,
          'product_barcode': productBarcode,
          'product_finish_date': finishTime
        });

        if (response > 0) {
          return right(true);
        } else {
          return left(Failure('فشلة الاضافة,الرجاء المحاولة لاحقا'));
        }
      } else {
        return left(Failure('هـذا المنتج مـوجود مسبقا'));
      }
    } catch (_) {
      return left(Failure('فشلة الاضافة,الرجاء المحاولة لاحقا'));
    }
  }
}
