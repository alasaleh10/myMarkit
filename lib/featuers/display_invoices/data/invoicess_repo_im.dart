import 'package:dartz/dartz.dart';
import 'package:my_markit/core/failure_class.dart';
import 'package:my_markit/core/sql_helper.dart';
import 'package:my_markit/featuers/display_invoices/data/invoicess_repo.dart';
import 'package:my_markit/featuers/display_invoices/data/models/invoice_clint_model.dart';
import 'package:my_markit/featuers/display_invoices/data/models/invoicess_items_model.dart';

class InvoicsessRepoIm implements InvoicsessRepo {
  @override
  Future<Either<Failure, List<InvoiveClintModel>>> getInvoicess(
      {required int type}) async {
    try {
      List<InvoiveClintModel> invoicess = [];
      var response = await SqlHeper.readdata(
          'SELECT invoice_id,clint_name,invoice_type,invoice_price,invoice_number FROM invoics WHERE invoice_type=$type ');

      for (var item in response) {
        invoicess.add(InvoiveClintModel.fromJson(item));
      }
      if (invoicess.isEmpty) {
        return left(Failure('لاتــوجد فواتير'));
      } else {
        return right(invoicess);
      }
    } catch (_) {
      return left(Failure('فـشلة العــملية'));
    }
  }

  @override
  Future<Either<Failure, List<InvoiveClintModel>>> searchClintInvoice(
      {required String name, required int type}) async {
    try {
      List<InvoiveClintModel> invoicess = [];
      var response = await SqlHeper.readdata(
          "SELECT invoice_id,clint_name,invoice_type,invoice_price,invoice_number FROM invoics WHERE invoice_type=$type AND clint_name LIKE '%$name%' ");
      for (var item in response) {
        invoicess.add(InvoiveClintModel.fromJson(item));
      }
      if (invoicess.isEmpty) {
        return left(Failure('لاتــوجد فواتير'));
      } else {
        return right(invoicess);
      }
    } catch (_) {
      return left(Failure('فـشلة العــملية'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteInvoicess(
      {required int id, required int invoiceNumber}) async {
    try {
      var response =
          await SqlHeper.deletdata("DELETE FROM invoics WHERE invoice_id=$id");
      if (response > 0) {
        await SqlHeper.deletdata(
            "DELETE FROM invoice_items WHERE number_invoice=$invoiceNumber");
        return right(true);
      } else {
        return left(Failure('فششلة عملية الحذف'));
      }
    } catch (_) {
      return left(Failure('فششلة عملية الحذف'));
    }
  }

  @override
  Future<Either<Failure, List<InvoicessItemsModel>>> displayInvoice(
      {required int invoiceNumbder}) async {
    try {
      List<InvoicessItemsModel> invoice = [];
      var response = await SqlHeper.readdata(
          """SELECT * FROM invoics JOIN invoice_items ON invoice_items.number_invoice =invoics.invoice_number
         WHERE invoics.invoice_number=$invoiceNumbder""");

     
      for (var item in response) {
        invoice.add(InvoicessItemsModel.fromJson(item));
      }
      if (invoice.isNotEmpty) {
        return right(invoice);
      } else {
        return left(Failure('حصلت مشكلة الرجاء المحاولة لاحقا'));
      }
    } catch (_) {
      return left(Failure('حصلت مشكلة الرجاء المحاولة لاحقا'));
    }
  }
}
