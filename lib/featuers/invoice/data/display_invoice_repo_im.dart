import 'package:dartz/dartz.dart';
import 'package:my_markit/core/failure_class.dart';
import 'package:my_markit/featuers/invoice/data/display_invoice_repo.dart';

class DisplayInvoiceRepoIm implements DisplayInvoiceRepo {
  @override
  Future<Either<Failure, dynamic>> getCashInvoices() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> getPostPaidIvoices() {
    throw UnimplementedError();
  }
}
