import 'package:expense_app/provider/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context, listen: true);
    final transactionList = provider.transaction;

    return SizedBox(
      height: 300,
      child: transactionList.isEmpty
          ? const Center(
              child: Text(
                'No Personal Expense Added',
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                final transcation = provider.transaction[index];

                return Card(
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Text(
                          transcation.amount.toString(),
                        ),
                      ),
                      title: Text(
                        transcation.title,
                        style: const TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        transcation.date.toString(),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          provider.removeTransaction(index);
                        },
                      )),
                );
              },
              itemCount: provider.transaction.length,
            ),
    );
  }
}
