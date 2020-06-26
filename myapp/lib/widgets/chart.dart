import 'package:flutter/material.dart';
import '../models/transactions.dart';
import './chartbar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transactions> recentTransactions;

  Chart(this.recentTransactions);

  List <Map <String, Object>> get groupTransaction{
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index),);
      var totalSum = 0.0;

      for(var i=0; i<recentTransactions.length ;i++)
      {
          if(recentTransactions[i].date.day == weekday.day &&
          recentTransactions[i].date.month == weekday.month &&
          recentTransactions[i].date.year == weekday.year)
          {
            totalSum += recentTransactions[i].amount;

          }
      }
    return {'day' : DateFormat.E().format(weekday).substring(0, 1), 'amount' : totalSum };
    },
    );
  }

  double get totalSpend{
    return groupTransaction.fold(1.0, (sum, item){
      return sum + item['amount'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Card(
        //elevation: 5,
        margin: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: 
            groupTransaction.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                              child: ChartBar(
                  data['day'], 
                  data['amount'], 
                  (
                    data['amount'] as double) / totalSpend
                    ),
              );
            }).toList(),

          
        ),
     
      
    );
  }
}