import 'package:flutter/material.dart';


void main()
{
  runApp(Expense());
}

class Expense extends StatelessWidget {

  Widget _firstContainer()
  {
    return Container(
      child: Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Gogame'),
                subtitle: Text('team'),
                trailing: Icon(Icons.notifications, size: 15.0,),
              ),
            ),
    );
  }

  Widget _secondContainer()
  {
    return Container(
      padding: EdgeInsets.all(6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right:10),
              height: 105,
              
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                  colors: [Colors.lightBlue, Colors.blueGrey ],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Expanded( child: Container(
                    alignment: Alignment.topLeft,
                    
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications_off
                        ), onPressed: null),
                  ),
                  ),
                  Expanded(
                    child: Center(
                        child: Text('23K',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'coins',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),)
                ],
              ),
            )
          ),
         //Spacer(),
          Expanded(
            child: Container(
              height: 105,
             
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.pink ],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: IconButton(
                        icon: Icon(
                          Icons.notifications), onPressed: null)
                        ),
                  Expanded(
                    child: Center(
                      child: Text('1K',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                    ) ,
                    ),  
                    Expanded(child: Text('coins',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                    ),))   
                ],
              ),
            ),
          ),
          //Spacer(),
          Expanded(
            child: Container(
              //padding: EdgeInsets.only(left: 10),
              height: 105,
              
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                  colors: [Colors.deepOrange, Colors.orangeAccent],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Expanded( child: Container(
                    alignment: Alignment.topLeft,
                    
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications_off
                        ), onPressed: null),
                  ),
                  ),
                  Expanded(
                    child: Center(
                        child: Text('23K',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'coins',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),)
                ],
              ),
              
            )
          ),
        ],
      ),
    );
  }

  Widget _thirdContainer()
  {
   return Container(
       child: Row(
         mainAxisAlignment: MainAxisAlignment.start,
         children: <Widget>[
           Container(
             
             width: 355,
             //width: 355,
             //color: Colors.purple,
             margin: EdgeInsets.all(1),
             padding: EdgeInsets.all(5),
             decoration: BoxDecoration(
             border: Border.all(color: Colors.purple),
             color: Colors.purple,
             ),
             child: ClipRRect( 
            borderRadius: new BorderRadius.circular(10.0),
                          child: Image.asset('assets/images/images1.jpg',
                            fit: BoxFit.fill,
                          ),
                          ),
           ),
         ],
       ),
   );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        
        appBar: AppBar(
          //backgroundColor: Color(0x44000000),
          backgroundColor: Colors.transparent,
        elevation: 0,
          titleSpacing: 0.0,
          centerTitle: true,
          title: Text('GOGAME', textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          ),
          actions: <Widget>[
            IconButton(icon: 
            Icon(Icons.menu, size: 27.0,color: Colors.black,), 
            onPressed: (){})
          ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _firstContainer(),
                  _secondContainer(),
                  _thirdContainer(),
                ],
              ),
            ),
          ),
          ),
        );
  }
}