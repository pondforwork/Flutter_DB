import 'package:flutter/foundation.dart';
import 'package:flutter_database/database/transaction_db.dart';
import 'package:flutter_database/models/transactions.dart';
import 'package:sembast/sembast.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];

  List<Transactions> getTransaction() {
    return transactions;
  }

  addTranscation(Transactions statement) async {
    // var db = TransactionDB(dbName: "transaction.db");
    Database db = await TransactionDB(dbName: "transactions.db").openDatabase();
    await TransactionDB(dbName: "transactions.db").insertData(statement);
    await TransactionDB(dbName: "transactions.db").loadAllData();
    transactions.insert(0, statement);

    // transactions.add(statement);
    notifyListeners();
  }
}
