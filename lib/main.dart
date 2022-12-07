import 'package:flutter/material.dart';

import '../models/transactions.dart';
import 'widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'personal expenses',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        appBarTheme: AppBarTheme.of(context).copyWith(
            titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )),
        textTheme: Theme.of(context).textTheme.copyWith(
              headline3: TextStyle(
                fontSize: 16,
              ),
              headline6: TextStyle(
                fontSize: 26,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.red,
          primary: Colors.blue,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _startAddNewTransactions(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: (HitTestBehavior.opaque),
          child: NewTransaction(_makeTransaction),
        );
      },
    );
  }

  final List<Transactions> _userTransactions = [
    /* Transactions(
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
    ),*/
  ];

  void _makeTransaction(String txTitle, double txAmount) {
    setState(() {
      _userTransactions.add(Transactions(
        id: "t ${DateTime.now().toString()}",
        title: txTitle,
        date: DateTime.now(),
        amount: txAmount,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("expenses"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _startAddNewTransactions(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              child:
                  Card(elevation: 5, color: Colors.blue, child: Text("CHART!")),
            ),
/*
            NewTransaction(_makeTransaction),
*/
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _startAddNewTransactions(context)),
    );
  }
}
