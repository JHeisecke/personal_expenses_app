import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function addNewTransaction;

  TransactionForm(this.addNewTransaction);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final conceptController = TextEditingController();
  DateTime _transactionDate;
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
    ).then((dateSelected) {
      if (dateSelected != null) {
        setState(() {
          _transactionDate = dateSelected;
        });
      }
    });
    //then happens after date is selected but functions still finishes the rest
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
                  Text(_transactionDate == null
                      ? "No Date Chosen"
                      : DateFormat.yMMMd().format(_transactionDate)),
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
