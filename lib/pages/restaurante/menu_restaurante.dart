import 'package:cardapio_show/helpers/post.dart';
import 'package:cardapio_show/helpers/user.dart';
import 'package:cardapio_show/pages/drawer/drawer.dart';
import 'package:cardapio_show/pages/restaurante/rest_reservas.dart';
import 'package:cardapio_show/pages/restaurante/rest_cardapio.dart';
import 'package:cardapio_show/pages/restaurante/rest_fechar.dart';
import 'rest_sugestao.promocao.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

  User user = User();                                          // PAGINA DE NAVEGAÇÃO DO RESTAURANTE
class Menu extends StatefulWidget {

    Post data;
    Menu(this.data);
    
  String opcao;
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {

    user.verificandoUsuario(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245,1),
      body: Padding(
        padding: EdgeInsets.only(top: 25,left: 10,right: 10,bottom: 5),
        child: Column(
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
                    Expanded(
                      flex: 1,
                      child:SingleChildScrollView(
                        child: Container(
                      margin: EdgeInsets.only(top: 10,),
                      padding: EdgeInsets.only(top: 10,left: 5,right: 5,bottom: 5),
                      color: Colors.white,
                      
                      child: 
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("images/restaurante.jpg"),
                            Container(
                              margin: EdgeInsets.only(top: 20 , bottom: 30),
                              child: Text(widget.data.razaosocial.toUpperCase(),
                            style:TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              
                              
                              )
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                
                                // Icon CARDAPIO
                                Expanded(
                                  child: GestureDetector(
                                    onTap:(){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Res_Cardapio(widget.data)));
                                    },
                                      child: Column(
                                        children: <Widget>[
                                          Image.asset("icons/cardapio.png",
                                      width: 70,
                                      height: 70,),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Text("Cardapio"),
                                      )
                                        ],
                                      )
                                  )
                                ),

                                // Icon Sugestão
                                Expanded(
                                  
                                  child: GestureDetector(
                                    onTap: (){
                                        widget.opcao = "sugestao";
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Sugestao(widget.data,widget.opcao)));

                                    },
                                      child: Column(
                                        children: <Widget>[
                                          Image.asset("icons/sugestoes.png",
                                      width: 70,
                                      height: 70,),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Text("Sugestão do Chef"),
                                      )
                                        ],
                                      )
                                  )
                                ),

                              // Icon Promocoes

                                Expanded(
                                  
                                  child: GestureDetector(
                                    onTap: (){
                                      widget.opcao = "promocao";
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=> Sugestao(widget.data,widget.opcao)));
                                    },
                                      child: Column(
                                        children: <Widget>[
                                          Image.asset("icons/promocoes.png",
                                      width: 70,
                                      height: 70,),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Text("Promoção do dia"),
                                      )
                                        ],
                                      )
                                  )
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Row(
                                children: <Widget>[
                                  
                                  // Icon FECHAR CONTA
                                  Expanded(
                                 
                                  child: GestureDetector(
                                    onTap: ()async{
                                   
                                    
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=> Fechar(widget.data)));

                                    },
                                      child: Column(
                                        children: <Widget>[
                                          Image.asset("icons/fechar.png",
                                      width: 70,
                                      height: 70,),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Text("Fechar Conta"),
                                      )
                                        ],
                                      )
                                  )
                                ),

                                // Icon RESERVAS
                                Expanded(
                                  
                                  child: GestureDetector(
                                    onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Reservas()));
                                    },
                                      child: Column(
                                        children: <Widget>[
                                          Image.asset("icons/reservas.png",
                                      width: 70,
                                      height: 70,),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Text("Reservas"),
                                      )
                                        ],
                                      )
                                  )
                                ),

                                // Icon FACEBOOK
                                Expanded(
                                  
                                  child: GestureDetector(
                                    onTap: ()async{
                                      if(widget.data.facebook == "" ||widget.data.facebook == null){
                                        return null;
                                      }else{
                                        await launch("${widget.data.facebook}");
                                      }
                                    },
                                      child: Column(
                                        children: <Widget>[
                                          Image.asset("icons/facebook.png",
                                      width: 70,
                                      height: 70,),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Text("Facebook"),
                                      )
                                        ],
                                      )
                                  )
                                ),
                                ],
                              ),
                            )

                          ],
                        )
                    )  ,
                      ) ,
                    )
          ],
        ),
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
