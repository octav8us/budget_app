import 'package:flutter/material.dart';
import './transaction_list.dart';
import '../models/transactions.dart';

import './new_transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transactions> _userTransactions = [
    Transactions(
      id: "t1",
      title: "clothes",
      date: DateTime.now(),
      amount: 55.5,
    ),
    Transactions(
      id: "t2",
      title: "books",
      date: DateTime.now(),
      amount: 66.5,
    ),
  ];

  @override

  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_makeTransaction),
        TransactionList(_userTransactions),
      ],

    );
  }

  void _makeTransaction(String txTitle, double txAmount){

      setState(() {
        _userTransactions.add(Transactions(
          id: "t ${DateTime.now().toString()}",
          title: txTitle,
          date: DateTime.now(),
          amount: txAmount,
        ));
      });
    }
  }


