import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


Key key;
var maskFormatter = new MaskTextInputFormatter(mask: '(##)#####-####', filter: { "#": RegExp(r'[0-9]') });
var teste = 0;
class Avisos{
  String mensagem;

  Avisos({this.mensagem});
  certeza(context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
      return AlertDialog(
      title: Text("Pedidos"),
      content: Text(this.mensagem),
      actions: [
      FlatButton(
        child: Text("SIM",style: TextStyle(color: Colors.green),),
        onPressed: () { },
      ),
      FlatButton(
          child: Text("Não",style: TextStyle(color: Colors.red),),
          onPressed: () { 
            return Navigator.pop(context);
          },
      ),
      ],
    );
    },
    );
  }

  // CONFIRMAR MESA

  
  
}
