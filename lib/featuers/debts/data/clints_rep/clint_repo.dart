import 'package:dartz/dartz.dart';
import 'package:my_markit/core/failure_class.dart';
import 'package:my_markit/featuers/debts/data/models/clint_model.dart';

abstract class ClintRepo {
  Future<Either<Failure, dynamic>> addClint(
      {required String name, required String phone});

  Future<Either<Failure, List<ClintModel>>> getClints();
  Future<Either<Failure, List<ClintModel>>> getCustomClint(
      {required String name});
}
