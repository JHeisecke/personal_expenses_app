import 'package:flutter/foundation.dart';

class Transaction {
  String id;
  String concept;
  double amount;
  DateTime date;

  Transaction({
    @required this.id,
    @required this.concept,
    @required this.amount,
    @required this.date,
  });
}
