import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class SqlHeper {
  static Database? _db;
  static Future<Database?> get db async {
    if (_db == null) {
      _db = await inizalizeDb();
      return _db;
    } else {
      return _db;
    }
  }

  static inizalizeDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'mymarket.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate, version: 3);
    return mydb;
  }

  static _onCreate(Database db, int verson) async {
    await db.execute('''
   CREATE TABLE "products" (
  "product_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "product_name" TEXT NOT NULL,
  "product_count" TEXT NOT NULL,
  "product_price" TEXT NOT NULL,
  "product_barcode" TEXT NOT NULL,
  "product_finish_date" TEXT NOT NULL

)
   ''');
    await db.execute('''
   CREATE TABLE "clints" (
  "clint_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "clint_name" TEXT NOT NULL,
  "clint_phone" TEXT NOT NULL,
  "createTime" TEXT NOT NULL

)
   ''');
    await db.execute('''
   CREATE TABLE "debts" (
  "debts_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "continet" TEXT NOT NULL,
  "price" INTEGER NOT NULL DEFAULT 0,
  "id_clint" INTEGER NOT NULL,
  "createTime" TEXT NOT NULL,
  FOREIGN KEY (id_clint) REFERENCES clints(clint_id)

)
   ''');

    log('crated');
  }

  static readdata(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  static insertdata(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  static deletdata(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  static uPdatedata(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  static addData({required String table, required dynamic data}) async {
    final db = _db;
    final res = await db?.insert(table, data);

    return res;
  }

  static searchBarcode(String barcode) async {
    final db = _db;
    final res = await db?.query('products', where: 'product_barcode=$barcode');

    return res;
  }

  static updateMessage(Map<String, dynamic> productModel, int id) async {
    final db = _db;
    final res =
        await db?.update('products', productModel, where: 'product_id=$id');

    return res;
  }

  addCategorie(dynamic categorie) async {
    final db = _db;
    final res = await db?.insert('categoris', categorie);

    return res;
  }

  static mydeletedatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'mymarket.db');
    await deleteDatabase(path);
  }
}
