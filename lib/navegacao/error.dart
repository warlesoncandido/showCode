
import 'package:cardapio_show/navegacao/inicio.dart';
import 'package:flutter/material.dart';

class Erro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245,1),
      body:   Padding(
                padding: EdgeInsets.only(top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 0,
                      child: Row(
                        
                        children: <Widget>[ 
                          Container(
                            height: 50,
                            width: 50,
                            // ,
                            child: Image.asset('images/icon-cardapio-show-transparente.png'),
                          ),
                           Text("CARDÁPIO SHOW",
                              style:TextStyle(
                                  color: Color.fromRGBO(252, 76, 2, 1)
                                  ,fontSize: 22,
                                  fontWeight: FontWeight.bold) ,),
                          
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                            color: Colors.white,
                            child: Center(
                              
                              child: Image.asset('images/sem-conexao.png',
                                      width: 200,
                                      height: 200,),
                            ),
                          )
                    ),
                    Container(
                      width: 200,
                      child: RaisedButton(
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Promo()));
                      },
                      child: Text(("Tentar Novamente")),
                    ),
                    ),
                  ],
                )
          )
    );
  }
}
