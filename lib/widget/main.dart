import 'package:flutter/material.dart';

import './transaction_form.dart';
import './transactions.dart';
import '../model/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter App', home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _showNewTransactionForm(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {}, child: TransactionForm(_addNewTransaction));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _showNewTransactionForm(context)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Card(
                child: Text("CHART!"),
                color: Colors.blue,
              ),
              height: 100,
              width: 300,
            ),
            Transactions(_userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showNewTransactionForm(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
