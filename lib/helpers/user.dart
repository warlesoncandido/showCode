import 'dart:async';
import 'dart:convert';
import 'package:cardapio_show/navegacao/inicio.dart';
import 'package:cardapio_show/navegacao/login.dart';
import 'package:cardapio_show/navegacao/recuperar.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class User{
  String id;
  String nome;
  String email;
  String phone;
  String senha;
  String cpf;


  User({this.id,this.nome,this.email,this.phone,this.senha,this.cpf});

  post(context)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
        Map<String, String> headers = {
         "Accept": "application/json",
         "Content-Type": "application/x-www-form-urlencoded",
         "tipo" : "cliente"
         
        };

    var url = "http://erp.addmob.com.br/post_cliente";
    var bytes =  utf8.encode(this.senha);
    var senha = sha256.convert(bytes).toString();
    print(senha);
    Map<String, dynamic> body = {
      'tipo': 'cliente',
       'json': '{"cliente": [{"id_cliente" : "0","nome": "${this.nome}", "email": "${this.email}", "telefone": "${this.phone.replaceAll("(", "").replaceAll(")", "").replaceAll("-", "")}","cpf_cnpj": "","senha": "$senha","ativo": "1"}]}'};
    
    http.Response response = await http.post(
      url,
      headers: headers ,
      body:body
    );
    prefs.setString("nomeUser", this.nome);
    prefs.setString("emailUser", this.email);
    prefs.setString("cpfUser", this.cpf);
    prefs.setString("phoneUser", this.phone);
    prefs.setString("senhaUser", this.senha);
    

    print("resposta : ${response.statusCode}");
    print("resposta : ${response.body}");

    if(response.statusCode != 200){
        dialogErro(context);
    }else{
      dialogok(context);
    }
  }

  login(context)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, String> headers = {
         "Accept": "application/json",
         "Content-Type": "application/x-www-form-urlencoded",
         "tipo" : "cliente"
         
        };

    var url = "http://erp.addmob.com.br/log_usuario";
    var bytes =  utf8.encode(this.senha);
    var senha = sha256.convert(bytes).toString();
    Map<String, dynamic> body = {
      "telefone" : "${this.phone.replaceAll("(", "").replaceAll(")", "").replaceAll("-", "")}",
      "senha" : "$senha"
    };
    http.Response response = await http.post(
      url,
      headers: headers ,
      body:body
      
    );
    print("resposta : ${response.statusCode}");
    print(response.body);
    Map dados = json.decode(response.body);

    for(var d in dados['response']){
      if(d.length > 0){
        this.nome = d['nome'];
        this.senha = d['senha'];
        this.phone = d['telefone'];
        this.id = d['id_cliente'];
        this.email = d['email'];
        this.cpf = d['cpf'];

        dialogLoginOk(context);
        prefs.setString("nomeUser", this.nome);
        prefs.setString("senhaUser", this.senha);
        prefs.setString("phoneUser", this.phone);
        prefs.setString("idUser", this.id);
        prefs.setString("emailUser", this.email);
        prefs.setString("cpfUser", this.cpf);

        Timer(Duration(seconds: 2), (){
          
        });

        Navigator.push(context, MaterialPageRoute(builder: (context)=>Promo()));
      }
    }
    if(dados['response'].length <= 0){
        dialogLoginErro(context);
      }

  }
  recuperando(context)async{
    var url = "http://erp.addmob.com.br/rec_usuario?telefone=${this.phone}";
   http.Response response = await http.get(url);
    try{

      Map dados = json.decode(response.body);
      this.email = dados["mensagem"];
      print(this.email);
      var emailfim = this.email.lastIndexOf("@");  
      dialogRec(context,this.email,emailfim);
      
    }catch(e){
      dialogRecErro(context);
    }
        
      

  }

  verificandoUsuario(context)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("idUser") == "" || prefs.getString("idUser") == null){
      Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);  }
  }

  atualizandoDados()async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
        Map<String, String> headers = {
         "Accept": "application/json",
         "Content-Type": "application/x-www-form-urlencoded",
         "tipo" : "cliente"
         
        };

    var url = "http://erp.addmob.com.br/update_cliente";
    var bytes =  utf8.encode(this.senha);
    var senha = sha256.convert(bytes).toString();
    print(senha);
    Map<String, dynamic> body = {
      'tipo': 'cliente',
       'json': '{"cliente": {"id_cliente" : "${prefs.getString("idUser")}","nome": "${this.nome}", "email": "${this.email}", "telefone": "${prefs.getString("phoneUser")}","cpf_cnpj": "00","senha": "$senha","ativo": 1}}'};
    
    http.Response response = await http.post(
      url,
      headers: headers ,
      body:body
    );
    
    

    print("resposta : ${response.statusCode}");
    print("resposta : ${response.body}");

    
  }


}


dialogErro(context){
   showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
            title: Text("Ops.. Alguma coisa deu errado",style: TextStyle(color: Colors.red , fontSize: 20),),
            content: 
              Icon(Icons.block,size: 35, color: Colors.red,),
            
            actions: [
              FlatButton(
            child: Text("OK"),
            onPressed: () { 
              Navigator.push(context, MaterialPageRoute(
                builder: (context) =>Loginv()
              ));
            },
              )
            ],
          );
            },
        );
        
}

dialogok(context){
   showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
            title: Text("Cadastrado com sucesso!!!",style: TextStyle(color: Colors.red , fontSize: 20),),
            content: 
              Icon(Icons.check,size: 35,color: Colors.green,),
            
            actions: [
              FlatButton(
            child: Text("OK"),
            onPressed: () { 
              Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
            },
              )
            ],
          );
            },
        );
        
}
dialogLoginOk(context){
   showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
            title: Text("Logado",style: TextStyle(color: Colors.green , fontSize: 20),),
            content: 
              Icon(Icons.check,size: 50,color: Colors.green,),
            
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
dialogLoginErro(context){
   showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
            title: Icon(Icons.close,size: 50,color: Colors.red,),
           
            content: 
               Text("Ops! Telefone ou senha está diferente",style: TextStyle(color: Colors.black , fontSize: 18),),
            actions: [
              FlatButton(
            child: Text("OK"),
            onPressed: () { 
              Navigator.pop(context);
            },
              )
            ],
          );
            },
        );
        
}
dialogRecErro(context){
   showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
            title: Text("Você digitou telefone errado!",style: TextStyle(color: Colors.black , fontSize: 20),),
            
            content: 
              Icon(Icons.close,size: 50,color: Colors.red,),
            
            actions: [
              FlatButton(
            child: Text("OK"),
            onPressed: () { 
              Navigator.pop(context);
            },
              )
            ],
          );
            },
        );
        
}
dialogRec(context,email,emailfim){
   showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
            title: Icon(Icons.check,size: 50,color: Colors.green,),
            
            content: Text("Senha enviada para ${email.replaceRange(3, emailfim, "*"*(emailfim-3))}",style: TextStyle(color: Colors.black , fontSize: 18),),
              
            
            actions: [
              FlatButton(
            child: Text("OK"),
            onPressed: () { 
              Navigator.pushReplacementNamed(context, "login");
              telefoneController.clear();
            },
              )
            ],
          );
            },
        );
        
}

