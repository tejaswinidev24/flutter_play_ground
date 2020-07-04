import 'package:flutter/material.dart';
import './widgets/transactionlist.dart';
import './widgets/newtransactionlist.dart';
import './widgets/chart.dart';
import './models/transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.black,

      ),
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //String name;
  //String amount;
  /*final titleController = TextEditingController();
  final amountController = TextEditingController();*/

  /*final List<Transactions> transactions = [
    Transactions(amount: 34.44, id: '1', name: 'Shoes', date: DateTime.now()),
    Transactions(amount: 38.44, id: '2', name: 'Groceries', date: DateTime.now()),
  ];*/

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  List <Transactions> _userTransactions = [
    /*Transactions(amount: 34.44, id: '1', name: 'Shoes', date: DateTime.now()),
    Transactions(amount: 38.44, id: '2', name: 'Groceries', date: DateTime.now()),*/
  ];

  List<Transactions> get _recentTransactions{
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String title, double txamount){
    final newTx = Transactions(name: title, amount: txamount, date: DateTime.now(), id: DateTime.now().toString()
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }


  void _startAddNewTransaction(BuildContext context)
  {
    showModalBottomSheet(context: context, builder: (_) {
      return GestureDetector(
        onTap: () {},
        child: NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque,
        );
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () => _startAddNewTransaction(context))
        ],
      ),
      body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Chart(_recentTransactions),
                    //UserTransaction(),
                  TransactionList(_userTransactions),
            ],
        ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context)),
    );
  }
}

