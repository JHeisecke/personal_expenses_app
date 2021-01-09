import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final conceptController = TextEditingController();
  final amountController = TextEditingController();

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
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
            ),
            RaisedButton(
              child: Text("Add Transaction"),
              textColor: Colors.purple,
              onPressed: () {
                print("concepto: $conceptController amount: $amountController");
              },
            )
          ],
        ),
      ),
    );
  }
}
