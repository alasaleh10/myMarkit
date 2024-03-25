import 'package:dartz/dartz.dart';
import 'package:my_markit/core/failure_class.dart';
import 'package:my_markit/core/sql_helper.dart';
import 'package:my_markit/featuers/debts/data/debets_repo/debets_repo.dart';
import 'package:my_markit/featuers/debts/data/models/debets_model.dart';

class DebetsRepoIm implements DebetsRepo {
  @override
  Future<Either<Failure, List<DebetsModel>>> getClintDebts(
      {required int id}) async {
    try {
      var response = await SqlHeper.readdata('''

SELECT * FROM 'debts' WHERE id_clint=$id



''');

      List<DebetsModel> debets = [];
      for (var item in response) {
        debets.add(DebetsModel.fromJson(item));
      }
      if (debets.isNotEmpty) {
        return right(debets);
      } else {
        return left(Failure('لايـوجد مديونيات'));
      }
    } catch (_) {
      return left(Failure('فشلة العـميلة حاول مجددا'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> addDebts(
      {required int id,
      required String discription,
      required int price}) async {
    Map<String, dynamic> data = {
      'continet': discription,
      'price': price,
      'id_clint': id,
      'createTime': DateTime.now().toString()
    };
    try {
      var response = await SqlHeper.addData(table: 'debts', data: data);

      if (response > 0) {
        return right(true);
      } else {
        return left(Failure('فـشلة الإضـافة'));
      }
    } catch (_) {
      return left(Failure('فـشلة الإضـافة'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> updateDebet(
      {required int debtId,
      required String discription,
      required int price}) async {
    Map<String, dynamic> data = {'continet': discription, 'price': price};

    try {
      var response = await SqlHeper.updateData(
          table: 'debts', data: data, where: 'debts_id=$debtId');
      if (response > 0) {
        return right(true);
      } else {
        return left(Failure('فشلة العملية'));
      }
    } catch (e) {
      return left(Failure('فشلة العملية'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteDebet({required int id}) async {
    try {
      var response =
          await SqlHeper.deleteData(table: 'debts', where: 'debts_id=$id');
      if (response > 0) {
        return right(true);
      } else {
        return left(Failure('فشلة العملية'));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> clearClintAccount({required int id}) async {
    var response =
        await SqlHeper.deleteData(table: 'debts', where: 'id_clint=$id');
    if (response > 0) {
      return right(true);
    } else {
      return left(Failure('فشلة العملية'));
    }
  }
}
