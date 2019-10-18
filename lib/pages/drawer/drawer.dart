import 'package:cardapio_show/pages/drawer/drawer_perfil.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'drawer_cupons.dart';

var nome;
var email;
var telefone;
var senha ;

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    

    shared();
    
    Widget _buildDrawerBack() => Container(
      color: Color.fromRGBO(245, 245, 245,1),
      
    );

    return Drawer(
      elevation: 10,
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 360.0,
                child: Stack(
                  children: <Widget>[   
                    Positioned( 
                      top: 70,
                      left: 5,
                      child:Container(  
                        child: Text("$nome",
                      style: TextStyle(fontSize:25 ,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),      
                      ),
                      )  
                    ),
                    Positioned(      
                      top: 1,
                      right: 10,
                      child:Container(
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Color.fromRGBO(252, 76, 2, 1),
                          child: Text("Sair"),
                          onPressed: (){
                            botaoSair(context);
                          },
                        ),
                      )
                    ),
                    Positioned(
                      left: 0.0,
                      top: 100,
                      child: 
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: <Widget>[   
                              Padding(padding: EdgeInsets.only(top:10,left: 10,right: 10),),
                              GestureDetector(
                                child: Row(
                                  children: <Widget>[
                                   Icon(Icons.person),
                                    Text(                               
                                  " Perfil ",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                  ],
                                ),
                                onTap: (){
                                  abrirPage(context, DrawerPerfil());
                                  },
                              ),
                              Divider(color: Colors.black,),
                              
                              GestureDetector(
                                child: Row(
                                  children: <Widget>[
                                   Icon(Icons.style),
                                    Text(                               
                                  " Meus Cupons ",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                  ],
                                ),
                                onTap: (){
                                  abrirPage(context, DrawerCupons());
                                  },
                              ),
                              ],
                            )                                      
                          )
                          ,Positioned(
                            bottom: -100,
                            left: 90,
                            child: Container(
                              width: 200,
                              height: 300,
                              child: Image.asset("images/prato.png"),
                            )
                          )
                        ],
                      )
                    )
                  ]
               )
              ]
            )
          );                                                 
      }
}

  // ALERTA DE ATENÇAO DESEJA SAIR
botaoSair(context)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  showDialog(
    context: context,
    builder: (BuildContext context){
      return  AlertDialog(
        elevation:10 ,
        title: Text("Atenção",style: TextStyle(color: Colors.red),),
        content: Text("Tem certeza que deseja sair?"),
        actions: <Widget>[
          FlatButton(
            child: Text("Sim",style:TextStyle(color: Colors.green)),
            onPressed: (){
              deslogado(context);
              prefs.remove("idUser");
              prefs.remove("senhaUser");
              prefs.remove("nomeUser");
              prefs.remove("phoneUser");
              prefs.remove("emailUser");
              prefs.remove("cpfUser");
            },
          ),
          FlatButton(
            child: Text("Não",style:TextStyle(color: Colors.red)),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
      );
    }
  );
}

// ALERT DE LOGOUT DE CLIENTE
deslogado(context){
  
  showDialog(
    context: context,
    builder: (BuildContext context){
      return  Icon(Icons.check,color:Colors.green,size: 100,);
    }
  );
 Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
}

// FUNÇÃO DE ABRIR PAGINAS DO DRAWER
abrirPage(context,page){
  showDialog(
    context: context,
      child: page, 
    );
}

shared()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  nome = prefs.getString("nomeUser");
  email = prefs.getString("emailUser");
  telefone = prefs.getString("phoneUser");
  senha = prefs.getString("senhaUser");
}