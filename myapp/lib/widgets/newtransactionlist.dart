import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx); 
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submit(){
    final enteredtitle = titleController.text;
    final enteredamount = double.parse(amountController.text);

    if(enteredtitle.isEmpty || enteredamount <= 0)
    {
      return;
    }
    
    widget.addTx(enteredtitle, enteredamount );
    Navigator.of(context).pop(); // To close the topmost screen
  }

  @override
  Widget build(BuildContext context) {
    return Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
               children: <Widget>[
                 TextField(
                   decoration: InputDecoration(
                     labelText: 'Title',
                   ),
                   controller: titleController,
                   onSubmitted: (_) => submit(), 
                   /*onChanged: (val) {
                    name = val;
                   },*/
                 ),
                 TextField(
                   decoration: InputDecoration(
                     labelText: 'Amount',
                   ),
                   controller: amountController,
                   keyboardType: TextInputType.number,
                   onSubmitted: (_) => submit(), 
                   /*onChanged: (val) {
                    amount = val;
                   },*/
                 ),
                 FlatButton(
                   onPressed: submit,
                   /* () {
                     //addTx(titleController.text, double.parse(amountController.text));
                     /*print(titleController.text);
                     print(amountController.text);*/
                   }, */
                   child: Text('Add Transactions',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                    ),
                   ),
                   )
               ],
              ),
            ),
    );
  }
}