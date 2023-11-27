import 'package:flutter/foundation.dart';
import 'package:flutter_database/database/transaction_db.dart';
import 'package:flutter_database/models/transactions.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [
    
  ];

  List<Transactions> getTransaction() {
    return transactions;
  }

  addTranscation(Transactions statement) async {
    // var db = TransactionDB(dbName: "transaction.db");
    var db = await TransactionDB(dbName: "transactions.db").openDatabase();
    print(db);
    transactions.insert(0, statement);
    // transactions.add(statement);
    notifyListeners();
  }
}
