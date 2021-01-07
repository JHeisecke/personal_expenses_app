import 'package:flutter/material.dart';

import './transaction.dart';

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

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: Column(
        children: [
          SizedBox(
            child: Card(
              child: Text("CHART!"),
              color: Colors.blue,
            ),
            height: 100,
            width: 300,
          ),
          Column(
            children: transaction.map((tx) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      padding: EdgeInsets.all(
                        10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ),
                        color: Colors.blue,
                      ),
                      child: Text(
                        "\$${tx.amount}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          tx.concept,
                        ),
                        Text(
                          tx.date.toString(),
                        )
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
          /*SizedBox(
            child: Card(
              child: Text("List of Transactions!"),
              color: Colors.red,
            ),
            height: 50,
            width: 200,
          ),*/
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
