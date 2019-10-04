import 'dart:convert';
import 'package:cardapio_show/helpers/cupom.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:crypto/crypto.dart';
import 'dart:math';


Cupom c = Cupom();
TextEditingController cupomController = TextEditingController();
Key key;
var maskFormatter = new MaskTextInputFormatter(mask: '(##)#####-####', filter: { "#": RegExp(r'[0-9]') });
var random = Random();
var valido = "S";
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

  gerandoCupom(context){

    var n1 = random.nextInt(100);
    var n2 = random.nextInt(100);
    var n3 = random.nextInt(100);
    var n4 = random.nextInt(100);
    var total = utf8.encode(n1.toString() + n2.toString() + n3.toString() + n4.toString());
    var sha = sha1.convert(total);
    var cupom = sha.toString().substring(0,6).toUpperCase();
    cupomController.text = "";


    
  }
 
}
