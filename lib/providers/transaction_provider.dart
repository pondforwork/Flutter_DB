import 'package:flutter/foundation.dart';
import 'package:flutter_database/models/Transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> transactions = [
    Transaction(title: "หนังสือ", amount: 500, date: DateTime.now()),
    Transaction(title: "รองเท้า", amount: 200, date: DateTime.now())
  ];

  List<Transaction>getTransaction(){
    return transactions;
  }

  addTranscation(Transaction statement){
    return transactions.add(statement);
  }
}
