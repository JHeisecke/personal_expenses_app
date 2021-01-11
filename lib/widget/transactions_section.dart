import 'package:flutter/material.dart';

import './transactions.dart';
import './transaction_form.dart';

import '../model/transaction.dart';

class TransactionsSection extends StatefulWidget {
  @override
  _TransactionsSectionState createState() => _TransactionsSectionState();
}

class _TransactionsSectionState extends State<TransactionsSection> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 'id1',
      concept: 'Shoes',
      amount: 102.22,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'id2',
      concept: 'Lamp',
      amount: 64.12,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String concepto, double amount) {
    final newTransaction = Transaction(
      concept: concepto,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TransactionForm(_addNewTransaction),
      Transactions(_userTransactions),
    ]);
  }
}
