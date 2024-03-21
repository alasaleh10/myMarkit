import 'package:dartz/dartz.dart';
import 'package:my_markit/core/failure_class.dart';
import 'package:my_markit/featuers/debts/data/models/debets_model.dart';

abstract class DebetsRepo {
  Future<Either<Failure, List<DebetsModel>>> getClintDebts({required int id});
  Future<Either<Failure, dynamic>> addDebts({
    required int id,
    required String discription,
    required int price,
  });
}
