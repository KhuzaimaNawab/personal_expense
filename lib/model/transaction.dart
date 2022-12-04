class Transaction {
  static const int id =1;
  final String title;
  final double amount;
  final String date;

  Transaction({
    id = id+1,
    required this.title,
    required this.amount,
    required this.date,
  });
}
