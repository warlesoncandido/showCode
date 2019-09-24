import 'package:flutter/material.dart';

class Erro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(100, 100, 100,1)
      ),
      backgroundColor: Color.fromRGBO(245, 245, 245,1),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
           Container(
                  width: 110,
                  height: 110,
                  child: Image.asset('images/icon-cardapio-show-transparente.png'),
                  margin: EdgeInsets.only(bottom: 15,top: 15),
                ),Container(
                  padding: EdgeInsets.only(top: 15,bottom: 15),
                  child: Text("CARDÁPIO SHOW",
                    style: TextStyle(color: Color.fromRGBO(252, 76, 2, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.bold)
                    ,),
                ),
                Divider(),
                Image.asset('images/sem-conexao.png',
                width: 200,
                height: 200,)

        ],
      ),
      )
    );
  }
}