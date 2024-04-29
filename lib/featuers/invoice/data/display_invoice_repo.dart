import 'package:dartz/dartz.dart';
import 'package:my_markit/core/failure_class.dart';

abstract class DisplayInvoiceRepo {
  Future<Either<Failure, dynamic>> getPostPaidIvoices();
  Future<Either<Failure, dynamic>> getCashInvoices();
}
