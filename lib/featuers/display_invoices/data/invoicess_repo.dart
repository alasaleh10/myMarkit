import 'package:dartz/dartz.dart';
import 'package:my_markit/core/failure_class.dart';
import 'package:my_markit/featuers/display_invoices/data/models/invoice_clint_model.dart';
import 'package:my_markit/featuers/display_invoices/data/models/invoicess_items_model.dart';

abstract class InvoicsessRepo {
  Future<Either<Failure, List<InvoiveClintModel>>> getInvoicess(
      {required int type});

  Future<Either<Failure, List<InvoiveClintModel>>> searchClintInvoice(
      {required String name, required int type});
  Future<Either<Failure, dynamic>> deleteInvoicess(
      {required int id, required int invoiceNumber});
  Future<Either<Failure, List<InvoicessItemsModel>>> displayInvoice(
      {required int invoiceNumbder});
}
