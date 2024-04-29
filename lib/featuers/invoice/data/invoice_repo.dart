import 'package:dartz/dartz.dart';
import 'package:my_markit/core/failure_class.dart';
import 'package:my_markit/featuers/add_product/data/product_model.dart';

abstract class InvoiceRepo {
  Future<Either<Failure, List<ProductModel>>> getProductByName(
      {required String name});
  Future<Either<Failure, List<ProductModel>>> getProductByBarcode(
      {required String barcode});

  Future<Either<Failure, dynamic>> confirmInvoice(
      {required int id, required String newCount});
  Future<Either<Failure, List<ProductModel>>> getProduct({required int id});
  Future<Either<Failure, dynamic>> addInvoice({
    required String clintName,
    required int invoiceType,
    required int invoicePrice,
  });
  Future<Either<Failure, int>> addItemsToInvoice({
    required String productName,
    required int ontPrice,
    required int count,
  });
}
