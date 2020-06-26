import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingpttotal;

  ChartBar(this.label, this.spendingAmount, this.spendingpttotal);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
        children: <Widget>[
            FittedBox(
              child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
              ),
            SizedBox(height: 2,),
            Container(
              height: 60,
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        //width: 1.0
                        ),
                        color: Color.fromRGBO(220, 220, 220, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),  
                  ),
                  FractionallySizedBox(heightFactor: spendingpttotal,
                  child: Container(
                    decoration:BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),)
                ],
              ),
            ),
            SizedBox(height: 2,),
            Text(label),
        ],
      ),
    );
  }
}