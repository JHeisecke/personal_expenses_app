import 'package:flutter/material.dart';
import 'package:flutter_assignment/model/transaction.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> userTransactions;

  Transactions(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: userTransactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No transactions added yet!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit
                        .cover, //respeta boundaries para mostrar la imagen
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
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
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          "\$${userTransactions[index].amount}",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userTransactions[index].concept,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat('yyyy-MM-dd')
                                .format(userTransactions[index].date),
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
              }, //itembuilder is called for every new item rendered
              itemCount: userTransactions.length,
            ),
    );
  }
}
