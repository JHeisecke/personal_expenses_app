import 'package:flutter/material.dart';
import 'package:flutter_assignment/model/transaction.dart';

import '../model/transaction.dart';
import './transaction_item.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  Transactions(this.userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Text(
                    "No transactions added yet!",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit
                          .cover, //respeta boundaries para mostrar la imagen
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(
                  userTransaction: userTransactions[index],
                  deleteTransaction: deleteTransaction);
            }, //itembuilder is called for every new item rendered
            itemCount: userTransactions.length,
          );
  }
}
