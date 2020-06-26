import 'package:flutter/material.dart';
/*import './transactionlist.dart';
import './newtransactionlist.dart';
import '../models/transactions.dart';*/


class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {

  /*List <Transactions> _userTransactions = [
    Transactions(amount: 34.44, id: '1', name: 'Shoes', date: DateTime.now()),
    Transactions(amount: 38.44, id: '2', name: 'Groceries', date: DateTime.now()),
  ];

  void addNewTransaction(String title, double txamount){
    final newTx = Transactions(name: title, amount: txamount, date: DateTime.now(), id: DateTime.now().toString()
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //NewTransaction(addNewTransaction),
        //TransactionList(_userTransactions),
      ],
    );
  }
}