import 'package:flutter/foundation.dart';
import 'package:flutter_database/database/transaction_db.dart';
import 'package:flutter_database/models/transactions.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [
    // Transaction(title: "หนังสือ", amount: 500, date: DateTime.now()),
    // Transaction(title: "รองเท้า", amount: 200, date: DateTime.now())
  ];

  List<Transactions>getTransaction(){
    return transactions;
  }

  addTranscation(Transactions statement) async{
    var db = await TransactionDB(dbName: "transactions.db").openDatabase();
    print(db);
    // transactions.add(statement);
    notifyListeners();
  }
}
