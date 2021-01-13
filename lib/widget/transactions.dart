import 'package:flutter/material.dart';
import 'package:flutter_assignment/model/transaction.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

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
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                elevation: 6,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text("\$${userTransactions[index].amount}"),
                      ),
                    ),
                  ),
                  title: Text(
                    userTransactions[index].concept,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(userTransactions[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 360
                      ? FlatButton.icon(
                          onPressed: () =>
                              deleteTransaction(userTransactions[index].id),
                          icon: Icon(Icons.delete),
                          label: Text("Remove"),
                          textColor: Theme.of(context).errorColor,
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () =>
                              deleteTransaction(userTransactions[index].id),
                        ),
                ),
              );
            }, //itembuilder is called for every new item rendered
            itemCount: userTransactions.length,
          );
  }
}
