import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widget/transaction_form.dart';
import 'widget/transactions.dart';
import 'model/transaction.dart';
import 'widget/chart.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.teal,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ), // Cambia todos los titles en la app en AppBar
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    /*Transaction(
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
    )*/
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String concepto, double amount, DateTime date) {
    final newTransaction = Transaction(
      concept: concepto,
      amount: amount,
      date: date,
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

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text("Personal Expenses"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                    child: Icon(CupertinoIcons.add),
                    onTap: () => _showNewTransactionForm(context)),
              ],
            ),
          )
        : AppBar(
            title: Text("Personal Expenses"),
            actions: [
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _showNewTransactionForm(context)),
            ],
          );
    final pageBody = SafeArea(
        child: SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.3,
              child: Chart(_recentTransactions)),
          Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.7,
              child: Transactions(_userTransactions, _deleteTransaction)),
        ],
      ),
    ));
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _showNewTransactionForm(context),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
