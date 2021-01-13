import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Function addNewTransaction;

  TransactionForm(this.addNewTransaction);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final conceptController = TextEditingController();

  final amountController = TextEditingController();

  void _submitData() {
    final concept = conceptController.text;
    final amount = double.parse(amountController.text);
    if (concept.isEmpty || amount < 0) {
      return;
    }
    widget.addNewTransaction(
      concept,
      amount,
    );
    Navigator.of(context).pop();
  }

  void _showdatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime.now(),
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
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text("No Date Chosen"),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      "Choose Date",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _showdatePicker,
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text("Add Transaction"),
              textColor: Theme.of(context).textTheme.button.color,
              color: Theme.of(context).primaryColor,
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
