import 'package:flutter/material.dart';

class Reservas extends StatefulWidget {
  @override
  _ReservasState createState() => _ReservasState();
}

class _ReservasState extends State<Reservas> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245,1), 
      body: Padding(
          padding: EdgeInsets.fromLTRB(10, 25, 10, 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                  Expanded(
                      flex: 0,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.navigate_before),
                              onPressed: (){
                                Navigator.pop(context);
                              }),                              
                          Container(
                            height: 50,
                            width: 50,
                            // ,
                            child: Image.asset('images/icon-cardapio-show-transparente.png'),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text("CARDÁPIO SHOW",
                              style:TextStyle(
                                  color: Color.fromRGBO(252, 76, 2, 1)
                                  ,fontSize: 22,
                                  fontWeight: FontWeight.bold) ,),
                          )
                        ],
                      ),
                    ),
                    
               ] )
    )
    );
  }
}