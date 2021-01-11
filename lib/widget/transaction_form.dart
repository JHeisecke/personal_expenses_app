import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final conceptController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;

  TransactionForm(this.addNewTransaction);

  void submitData() {
    final concept = conceptController.text;
    final amount = double.parse(amountController.text);
    if (concept.isEmpty || amount < 0) {
      return;
    }
    addNewTransaction(
      concept,
      amount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Concept"),
              controller: conceptController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) => submitData(),
            ),
            RaisedButton(
              child: Text("Add Transaction"),
              textColor: Colors.purple,
              onPressed: () => submitData,
            )
          ],
        ),
      ),
    );
  }
}
