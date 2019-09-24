import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:url_launcher/url_launcher.dart';

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

  confirmMesa(context){
    Dialog errorDialog = Dialog(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
  child: Container(
    height: 300.0,
    width: 300.0,

    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding:  EdgeInsets.all(15.0),
          child: SizedBox(
            width: 150,
            child: TextField(
                    textAlign: TextAlign.center,
                      decoration: InputDecoration(
                      hintText: "Digite a sua mesa",
                      hintStyle: TextStyle(color:Colors.black),
                      alignLabelWithHint: true
              
            ),
          )
          )
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: SizedBox(
            width: 150,
            child: TextFormField(
                    textAlign: TextAlign.center,
                    inputFormatters: [maskFormatter],
                    maxLength: 14,
                      decoration: InputDecoration(
                      hintText: "(31)99999-9999",
                      hintStyle: TextStyle(color: Colors.black),
                      alignLabelWithHint: true
              
            ),
          )
          )
        ),
        Padding(padding: EdgeInsets.only(top: 50.0)),
        FlatButton(onPressed: (){
           showDialog(
             context: context,
             builder: (BuildContext){
               while(teste == 1){
                 return Scaffold(
                   backgroundColor: Colors.transparent,
                   body: Container(
                   child: Center(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         CircularProgressIndicator(),
                         Padding(padding: EdgeInsets.all(10),),
                         Text("Aguardando autorização!",style:TextStyle(color: Colors.blue,fontSize: 25))
                       ],
                     ),
                   )
                 ),
                 );
               }
               return Center(child: Icon(Icons.check , size: 100 , color: Colors.green,),); 
             }
           );
        
        },
            child: Text('Solicitar Confirmação', style: TextStyle(color: Colors.purple, fontSize: 18.0),))
      ],
    ),
  ),
  );
  showDialog(context: context, builder: (BuildContext context) => errorDialog);

  }
  
}
