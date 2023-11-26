import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class TransactionDB {
  late String dbName;
  TransactionDB({required this.dbName});
  Future<String> openDatabase() async {
    dbName = "transaction.db";
    // เก็บค่าตำแหน่งเป็น Directory เลย
    Directory appDirectory = await getApplicationDocumentsDirectory();
    // Join คือการเอาตำแหน่ง Folder มาต่อกับชื่อของ Db เพื่อให้ได้ Path เต็ม
    String dbLocation = join(appDirectory.path, dbName);
    return dbLocation;
  }
}
