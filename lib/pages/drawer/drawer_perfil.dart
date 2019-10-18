import 'dart:convert';
import 'package:cardapio_show/helpers/user.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:cardapio_show/helpers/promocao.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'drawer.dart';


TextEditingController nomeController = TextEditingController();
TextEditingController emailController = TextEditingController();

TextEditingController senhaController = TextEditingController();
TextEditingController senhaAntigaController = TextEditingController();
var senha;

User user = User();

class DrawerPerfil extends StatefulWidget {
  @override
  _DrawerPerfilState createState() => _DrawerPerfilState();
}

class _DrawerPerfilState extends State<DrawerPerfil> {
  @override
  Widget build(BuildContext context) {
    
    dados()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      nomeController.text = prefs.getString("nomeUser");
      emailController.text = prefs.getString("emailUser");
      
      senha = prefs.getString("senhaUser");
    }
    dados();
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245,1),
      body:   Padding(
                padding: EdgeInsets.only(top: 25,left: 15,right: 15),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 0,
                      child: Column(
                        children: <Widget>[
                          Row(
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Perfil",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      )
                        ],
                      )
                    ),
                    Expanded(
                        flex: 1,
                        child: SingleChildScrollView(
                          child: Column(
                          children: <Widget>[
                            TextField(
                              controller: nomeController,
                              decoration: InputDecoration(
                                labelText: "Nome"
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(5),),
                            TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: "E-mail"
                              ),
                            ),
                            
                            Padding(padding: EdgeInsets.all(5),),
                            TextField(
                              controller: senhaController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Nova Senha"
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(5),),
                            Container(
                              constraints: BoxConstraints(
                                minWidth: 200,
                                maxWidth: 500
                              ),
                              child: RaisedButton(
                                color: Colors.green,
                                textColor: Colors.white,
                                child: Text("Editar",style: 
                                TextStyle(fontSize: 16),),
                                onPressed: ()async{
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  if(senhaController.text.isEmpty){
                                    user.nome = nomeController.text == "" ? prefs.getString("nomeUser") : nomeController.text;
                                    user.email = emailController.text== "" ? prefs.getString("emailUser") : emailController.text;
                                   
                                  }else{
                                    user.nome = nomeController.text == "" ? prefs.getString("nomeUser") : nomeController.text;
                                    user.email = emailController.text== "" ? prefs.getString("emailUser") : emailController.text;
                                    user.senha = senhaController.text== "" || senhaController.text== null ? prefs.getString("senhaUser") : senhaController.text;
                                  }
                                  user.atualizandoDados();
                                  alteracao(context);
                                },
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey)
                                ),
                              ),
                            )
                          ],
                        ),
                        )
                    ) 
                  ],
                )
                
            ),

            bottomNavigationBar: Container(
              height: 50,
              child: BottomAppBar(
                notchMargin: 4.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    IconButton(
                      onPressed:(){
                        showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
                          return  CustomDrawer();
                        });
                      } ,
                      icon: Icon(Icons.menu),)
                    
              ],),
            ),
            )   
    );
  }
}



alteracao(context)async{
    showDialog(
      context: context,
      builder: (BuildContext context) {
      return AlertDialog(
      title: Icon(Icons.check,size: 35,color: Colors.green,),
      content: Text("Seus dados foram atualizados!! :)"),
      actions: [
      FlatButton(
        child: Text("ok",style: TextStyle(color: Colors.green),),
        onPressed: ()async{
        return Navigator.pushNamed(context, "inicio");
        },
      ),
      
      ],
    );
  }
  );
}

