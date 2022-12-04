import 'package:expense_app/provider/transaction_provider.dart';
import 'package:expense_app/util/date_time_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowBottomSheet extends StatefulWidget {
  const ShowBottomSheet({super.key});

  @override
  State<ShowBottomSheet> createState() => _ShowBottomSheetState();
}

class _ShowBottomSheetState extends State<ShowBottomSheet> {
  final formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final amount = TextEditingController();
  bool chooseDate = false;
  DateTime selectedDate = DateTime.now();
  String date = '';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SizedBox(
        height: 300,
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                textField('Title', title, TextInputType.name),
                const SizedBox(
                  height: 10,
                ),
                textField('Amount', amount, TextInputType.number),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    chooseDate
                        ? Text('Picked Date $date')
                        : const Text('No Date Choosen!'),
                    ElevatedButton(
                      onPressed: showCalender,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        elevation: MaterialStateProperty.all(0),
                      ),
                      child: const Text(
                        'Choose Date',
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    provider.addTransaction(
                        title.text, double.parse(amount.text), date);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Add Transaction',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showCalender() async {
    final DateTime? datePicker = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2022, 12),
      lastDate: DateTime(2030, 12),
    );

    if (datePicker != null && datePicker != selectedDate) {
      setState(() {
        selectedDate = datePicker;
        chooseDate = true;
      });
    }
    date = Util.convertDateTimeDisplay(selectedDate.toString());
  }

  TextField textField(
      String label, TextEditingController controller, TextInputType inputType) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
      ),
      keyboardType: inputType,
    );
  }
}
