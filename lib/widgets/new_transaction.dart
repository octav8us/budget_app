import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function(String, double) _makeTransaction;

  NewTransaction(this._makeTransaction);

  @override
  Widget build(BuildContext context) {
    void submitData() {
      print("ter  ${amountController.text}");
      if (!(amountController.text.isNotEmpty &&
          titleController.text.isNotEmpty)) {
        return;
      }
      final enterdTitle = titleController.text;
      final enterdAmount = num.tryParse(amountController.text)?.toDouble();

      if (enterdAmount == null) {
        return;
      }
      _makeTransaction(enterdTitle, enterdAmount);
      Navigator.of(context).pop();
    }

    return Card(
        child: Container(
      padding: const EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            style: Theme.of(context).textTheme.titleMedium,
            decoration: const InputDecoration(hintText: 'title'),
            controller: titleController,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
            style: Theme.of(context).textTheme.titleMedium,
            onSubmitted: (_) => submitData(),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(5, 20, 20, 5),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.purple,
              ),
              onPressed: () => submitData(),
              child: const Text(
                'submit',
              ),
            ),
          )
        ],
      ),
    ));
  }
}
