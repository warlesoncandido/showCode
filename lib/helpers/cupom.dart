
import 'dart:convert';
import 'package:cardapio_show/navegacao/error.dart';
import 'package:cardapio_show/navegacao/inicio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Cupom {
  String codregistro;
  String cupom;
  String idCliente;
  String idPromocao;

  Cupom({this.codregistro, this.cupom, this.idCliente, this.idPromocao});

  Cupom.fromJson(Map<String, dynamic> json) {
    codregistro = json['codregistro'];
    cupom = json['cupom'];
    idCliente = json['id_cliente'];
    idPromocao = json['id_promocao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codregistro'] = this.codregistro;
    data['cupom'] = this.cupom;
    data['id_cliente'] = this.idCliente;
    data['id_promocao'] = this.idPromocao;
    return data;
  }

  postarCupom(context)async{

    SharedPreferences prefs  = await SharedPreferences.getInstance();
        Map<String, String> headers = {
         "Accept": "application/json",
         "Content-Type": "application/x-www-form-urlencoded",
         "tipo" : "cliente"
         
        };

    var url = "http://erp.addmob.com.br/cadastro_cupom?cupom";
    Map<String, dynamic> body = {
      
       'cupom': '[{"codregistro" : "${this.codregistro}" , "cupom":"${this.cupom}" , "id_cliente" : "${prefs.getString("idUser")}" , "id_promocao" : "${this.idPromocao}"}]',
       'idpromo': '${this.idPromocao}'
       };
    
    http.Response response = await http.post(
      url,
      headers: headers ,
      body:body,
      
    );
    print("resposta : ${response.statusCode}");
    Map dados = json.decode(response.body); 
    
    if(response.statusCode != 200){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Erro()));
    }else{
      if(dados['responde'] == "erro"){
        dialogAcabou(context);
    }else{
       dialogSeu(context);
    }
    }
  }

}

dialogAcabou(context){
   showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
            title: Text("Hum?! Quase você conseguiu",style: TextStyle(color: Colors.red , fontSize: 20),),
            content: 
              Text("Esse cupom acabou, mas temos outras promoções. Escolha outra ;)"),
            
            actions: [
              FlatButton(
            child: Text("OK"),
            onPressed: () { 
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Promo()));
            },
              )
            ],
          );
            },
        );
        
}

dialogSeu(context){
   showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
            
            content: Text("Uau! Esse cupom agora é seu ;)"),
            actions: [
              FlatButton(
            child: Text("OK"),
            onPressed: () { 
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Promo()));
            },
              )
            ],
          );
            },
        );
        
}