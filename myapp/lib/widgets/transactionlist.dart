import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions ;

  TransactionList(this.transactions);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: transactions.isEmpty ? Center(child: Text('No transactions yet')) : ListView.builder(
        itemBuilder: (ctx, index) {
            return Card( 
                    elevation: 5,
                      child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                    width:2,
                                  ),
                                  
                                ),
                                 child: Text('\$${transactions[index].amount.toStringAsFixed(2)}',
                                 style: TextStyle(color: Colors.blueAccent,
                                 fontWeight: FontWeight.bold,
                                 ),
                                 ),
                                
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                   Text(transactions[index].name,
                                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                                   ),
                                   Text(DateFormat.yMMMd().format(transactions[index].date),
                                    style: TextStyle(fontSize: 12, color: Colors.grey,),),
                                ],
                              )
                            ],
                          ),
                        );
        },
        itemCount: transactions.length,
              /*children: [Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:
                  transactions.map((tx) {
                      return 
                  }).toList()
              ),
              ],*/
              ),
    );
  }
}