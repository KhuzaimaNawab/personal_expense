import 'package:expense_app/model/transaction.dart';
import 'package:flutter/cupertino.dart';

class TransactionProvider with ChangeNotifier {
  final List<Transaction> _transaction = [];
  List<Transaction> get transaction => _transaction;

  void removeTransaction(int index) {
    _transaction.removeAt(index);
    notifyListeners();
  }

  void addTransaction(String title, double amount,String date) {
    _transaction.add(
      Transaction(
        amount: amount,
        date: date,
        title: title,
      ),
    );
    notifyListeners();
  }
}
