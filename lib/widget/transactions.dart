import 'package:flutter/material.dart';
import 'package:flutter_assignment/model/transaction.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> userTransactions;

  Transactions(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: userTransactions.map((tx) {
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
                    color: Colors.purple,
                    width: 2,
                  ),
                ),
                child: Text(
                  "\$${tx.amount}",
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx.concept,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd').format(tx.date),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
