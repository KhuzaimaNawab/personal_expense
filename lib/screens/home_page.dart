import 'package:flutter/material.dart';

import '../widgets/expense_chart.dart';
import '../widgets/show_bottom_sheet.dart';
import '../widgets/transaction_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const ShowBottomSheet(),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: Column(
        children: const [
           ExpenseChart(),
           SizedBox(
            height: 10,
          ),
           TransactionList(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => const ShowBottomSheet(),
          );
        },
        backgroundColor: Colors.amber,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
