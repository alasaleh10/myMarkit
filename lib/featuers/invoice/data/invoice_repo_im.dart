import 'package:dartz/dartz.dart';
import 'package:my_markit/core/failure_class.dart';
import 'package:my_markit/core/sql_helper.dart';
import 'package:my_markit/featuers/add_product/data/product_model.dart';
import 'package:my_markit/featuers/invoice/data/invoice_repo.dart';

class InvoiceRepoIm implements InvoiceRepo {
  @override
  Future<Either<Failure, List<ProductModel>>> getProductByName({
    required String name,
  }) async {
    try {
      var response = await SqlHeper.readdata(
          "select * from products where product_name like '%$name%'");

      List<ProductModel> products = [];

      for (var item in response) {
        products.add(ProductModel.fromJson(item));
      }

      if (products.isEmpty) {
        return left(Failure('لا يـوجد منتج'));
      } else {
        return right(products);
      }
    } catch (_) {
      return left(Failure('تعذر البحث الرجاء المحاولة لاحقا'));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProductByBarcode(
      {required String barcode}) async {
    try {
      var response = await SqlHeper.readdata(
          "select * from products where product_barcode like '%$barcode%'");

      List<ProductModel> products = [];

      for (var item in response) {
        products.add(ProductModel.fromJson(item));
      }

      if (products.isEmpty) {
        return left(Failure('لا يـوجد منتج'));
      } else {
        return right(products);
      }
    } catch (_) {
      return left(Failure('تعذر البحث الرجاء المحاولة لاحقا'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> confirmInvoice(
      {required int id, required String newCount}) async {
    try {
      var response = await SqlHeper.uPdatedata(
          'UPDATE products SET product_count=$newCount WHERE product_id=$id');
      if (response > 0) {
        return right(true);
      } else {
        return left(Failure('فـشلة العملية'));
      }
    } catch (_) {
      return left(Failure('فـشلة العملية'));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProduct(
      {required int id}) async {
    try {
      List<ProductModel> product = [];
      var response = await SqlHeper.readdata(
          'select * from products where product_id=$id');
      for (var item in response) {
        product.add(ProductModel.fromJson(item));
      }
      if (product.isEmpty) {
        return left(Failure('لايــوجد منتجات'));
      } else {
        return right(product);
      }
    } catch (_) {
      return left(Failure('فشلة العميلة'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> addInvoice({
    required String clintName,
    required int invoiceType,
    required int invoicePrice,
  }) async {
    int invoiceNumber = await getMaxInvoiceNumber();
    Map<String, dynamic> data = {
      'clint_name': clintName,
      'invoice_number': invoiceNumber,
      'invoice_type': invoiceType,
      'invoice_price': invoicePrice,
      'createTime': DateTime.now().toString()
    };

    try {
      var response = await SqlHeper.addData(table: 'invoics', data: data);

      if (response > 0) {
        return right(true);
      } else {
        return left(Failure('فشلة العملية'));
      }
    } catch (_) {
      return left(Failure('فشلة العملية'));
    }
  }

  Future<int> getMaxInvoiceNumber() async {
    var resulut = await SqlHeper.readdata(
        'select max(invoice_number) as invoice_number from invoics');
    if (resulut[0]['invoice_number'] == null) {
      return 1;
    } else {
      return resulut[0]['invoice_number'] + 1;
    }
  }

  @override
  Future<Either<Failure, int>> addItemsToInvoice(
      {required String productName,
      required int ontPrice,
      required int count,
      r}) async {
    int lastInvoice = await getLastInvice();
    try {
      Map<String, dynamic> data = {
        'product_name': productName,
        'ont_price': ontPrice,
        'count': count,
        'number_invoice': lastInvoice
      };
      var response = await SqlHeper.addData(table: 'invoice_items', data: data);

      if (response > 0) {
        return right(lastInvoice);
      } else {
        return left(Failure('فشلة العملية'));
      }
    } catch (_) {
      return left(Failure('فشلة العملية'));
    }
  }

  Future<int> getLastInvice() async {
    var resulut = await SqlHeper.readdata(
        'SELECT invoice_number as lastInvoice FROM invoics ORDER BY invoice_id DESC LIMIT 1');
    return resulut[0]['lastInvoice'];
  }
}
