import 'package:dartz/dartz.dart';

import 'package:my_markit/core/failure_class.dart';
import 'package:my_markit/core/sql_helper.dart';
import 'package:my_markit/featuers/debts/data/clints_rep/clint_repo.dart';
import 'package:my_markit/featuers/debts/data/models/clint_model.dart';

class ClintRepoIm implements ClintRepo {
  @override
  Future<Either<Failure, dynamic>> addClint(
      {required String name, required String phone}) async {
    try {
      List<ClintModel> clints = [];
      var respone = await SqlHeper.readdata(
          "select * from clints where clint_name='$name' and clint_phone='$phone' ");

      for (var item in respone) {
        clints.add(ClintModel.fromJson(item));
      }
      if (clints.isNotEmpty) {
        return left(Failure('هـذا العـميل موجود'));
      } else {
        var response = await SqlHeper.addData(table: 'clints', data: {
          'clint_name': name,
          'clint_phone': phone,
          'createTime': DateTime.now().toString()
        });

        if (response > 0) {
          return right(true);
        } else {
          return left(Failure('تــعذرت الإضـافة'));
        }
      }
    } catch (_) {
      return left(Failure('تــعذرت الإضـافة'));
    }
  }

  @override
  Future<Either<Failure, List<ClintModel>>> getClints() async {
    try {
      List<ClintModel> clints = [];

      var response = await SqlHeper.readdata('SELECT * FROM clints');

      for (var item in response) {
        clints.add(ClintModel.fromJson(item));
      }
      if (clints.isNotEmpty) {
        return right(clints);
      } else {
        return left(Failure('لايـوجد عملاء'));
      }
    } catch (_) {
      return left(Failure('فشلة العميلة حاول مجددا'));
    }
  }

  @override
  Future<Either<Failure, List<ClintModel>>> getCustomClint(
      {required String name}) async {
    try {
      List<ClintModel> clints = [];

      var response = await SqlHeper.readdata(
          "SELECT * FROM clints WHERE clint_name LIKE '%$name%' ");

      for (var item in response) {
        clints.add(ClintModel.fromJson(item));
      }
      if (clints.isNotEmpty) {
        return right(clints);
      } else {
        return left(Failure(' لايـوجد عملاء'));
      }
    } catch (_) {
      return left(Failure('فشلة العميلة حاول مجددا'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteClint({required int id}) async {
    try {
      var response =
          await SqlHeper.deleteData(table: 'clints', where: 'clint_id=$id');

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
  Future<Either<Failure, dynamic>> getClintSum({required int id}) async {
    try {
      var response = await SqlHeper.readdata(
          'SELECT SUM(price) FROM debts WHERE id_clint=$id');

      if (response[0]['SUM(price)'] == null) {
        return right(true);
      } else {
        return left(Failure('لايمكن الحذف لانه لديه مديونات'));
      }
    } catch (e) {
  
      return left(Failure('فشلة العملية'));
    }
  }
}
// SELECT S_PRICE,id_clint,clint_name
// from
// (SELECT SUM(price) S_PRICE,
//     id_clint FROM debts  GROUP BY id_clint) sum_price, clints WHERE sum_price.id_clint=clints.clint_id
