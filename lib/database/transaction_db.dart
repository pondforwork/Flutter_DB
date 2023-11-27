import 'dart:io';
import 'package:flutter_database/models/transactions.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransactionDB {
  late String dbName;
  TransactionDB({required this.dbName});

  Future<Database> openDatabase() async {
    dbName = "transaction.db";
    // เก็บค่าตำแหน่งเป็น Directory เลย
    Directory appDirectory = await getApplicationDocumentsDirectory();
    // Join คือการเอาตำแหน่ง Folder มาต่อกับชื่อของ Db เพื่อให้ได้ Path เต็ม
    String dbLocation = join(appDirectory.path, dbName);
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  //บันทึกข้อมูลลง Database
  Future<int> insertData(Transactions statement) async {
    var db = await openDatabase();
    var store = intMapStoreFactory.store("expense");
    var keyID = store.add(db, {
      "title":statement.title,
      "amount":statement.amount,
      "date":statement.date.toIso8601String()
        });
    db.close();
    return keyID;
  }
}

