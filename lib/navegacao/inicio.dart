import 'dart:convert';
import 'package:cardapio_show/helpers/promocao.dart';
import 'package:cardapio_show/helpers/user.dart';
import 'package:cardapio_show/navegacao/cardapio.dart';
import 'package:cardapio_show/navegacao/login.dart';
import 'package:cardapio_show/pages/cardpromo.dart';
import 'package:cardapio_show/pages/drawer/drawer.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



User user = User();
class Promo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     
     verificandoUsuario()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.getString("idUser") == "" || prefs.getString("idUser") == null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginv()));   
      }
    }
  verificandoUsuario();
    return Scaffold(  
      backgroundColor: Color.fromRGBO(245, 245, 245,1),
      body:  Padding(
                padding: EdgeInsets.only(top: 25,left: 10 , right: 10),
                child: Column(
                  
                  children: <Widget>[
                    Expanded(
                      flex: 0,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.navigate_before),
                              onPressed: (){
                               
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
                        child: Container( 
                          child: SingleChildScrollView(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Hoje quero",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400
                                )),
                                Container( 
                                  
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(top: 30,bottom: 30),
                                          child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: GestureDetector(
                                              child: Column(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 5),
                                                  height: 70,
                                                  width: 70,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage("http://erp.addmob.com.br/static/imagens_empresas/menu/mineira.jpg"),
                                                  ),
                                                ),
                                                Text("Mineira",style: 
                                                TextStyle(fontSize: 13 ),)
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio("1")));
                                            },
                                            )
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              child: Column(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 5),
                                                  height: 70,
                                                  width: 70,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage("http://erp.addmob.com.br/static/imagens_empresas/menu/contemporanea.jpg"),
                                                  ),
                                                ),
                                                Text("Contemporânea",style: 
                                                TextStyle(fontSize: 13 ),)
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio("3")));
                                            },
                                            )
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              child: Column(
                                                
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 5),
                                                  height: 70,
                                                  width: 70,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage("http://erp.addmob.com.br/static/imagens_empresas/menu/peixes.jpg"),
                                                  ),
                                                ),
                                                Text("Peixes",style: 
                                                TextStyle(fontSize: 13 ),
                                                )
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio("4")));
                                            },
                                            )
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              child: Column(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 5),
                                                  height: 70,
                                                  width: 70,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage("http://erp.addmob.com.br/static/imagens_empresas/menu/petisco.jpeg"),
                                                  ),
                                                ),
                                                Text("Bar / Petisco",style: 
                                                TextStyle(fontSize: 13 ),)
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio("5")));
                                            },
                                            )
                                          ), 
                                        ],
                                      ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 20),
                                        child: Row(
                                        children: <Widget>[ 
                                          Expanded(
                                            child: GestureDetector(
                                              child: Column(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 5),
                                                  height: 70,
                                                  width: 70,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage("http://erp.addmob.com.br/static/imagens_empresas/menu/italiana.jpg"),
                                                  ),
                                                ),
                                                Text("Italiana / Pizza",style: 
                                                TextStyle(fontSize: 13 ),)
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio("6")));
                                            },
                                            )
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              child: Column(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 5),
                                                  height: 70,
                                                  width: 70,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage("http://erp.addmob.com.br/static/imagens_empresas/menu/hamburguer.jpg"),
                                                  ),
                                                ),
                                                Text("Hamburgueria",style: 
                                                TextStyle(fontSize: 13 ),)
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio("7")));
                                            },
                                            )
                                          ),
                                         Expanded(
                                            child: GestureDetector(
                                              child: Column(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 5),
                                                  height: 70,
                                                  width: 70,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage("http://erp.addmob.com.br/static/imagens_empresas/menu/brasileira.jpg"),
                                                  ),
                                                ),
                                                Text("Brasileira",style: 
                                                TextStyle(fontSize: 13 ),)
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio("8")));
                                            },
                                            )
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              child: Column(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 5),
                                                  height: 70,
                                                  width: 70,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage("http://erp.addmob.com.br/static/imagens_empresas/menu/japonesa.jpg"),
                                                  ),
                                                ),
                                                Text("Japonesa")
                                              ],
                                            ),
                                            onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio("2")));
                                            },
                                            )
                                          ), 
                                        ],
                                      ),
                                      )
                                    ],
                                  ),
                                ),
                                // Divider **Promoções**//
                                Text("Promoção",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400
                                )),
                                Container(
                                   margin: EdgeInsets.only(top: 20),
                                  height: 200,
                                  child: FutureBuilder<List<Promocao>>(
                             future: _recuperandoPromo(context,"nao"),
                            builder: (context,snapshot){
                              switch(snapshot.connectionState){
                                case ConnectionState.none:
                                case ConnectionState.waiting:
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                default:
                                        if(!snapshot.hasData){
                                          Center(
                                            child: Column(
                                              children: <Widget>[
                                                CircularProgressIndicator(),
                                                Text("Aguarde")
                                              ],
                                            ),
                                          );
                                        }else{
                                          return ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context,index){
                                        return GestureDetector(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>cardpromo(snapshot.data[index])));
                                          },
                                          child:Container( 
                                            margin: EdgeInsets.all(2),
                                            width: 175,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              // border: Border.all(width: 0.2,color: Colors.grey),
                                              borderRadius:BorderRadius.circular(5),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 3),
                                                  height:100 ,
                                                  decoration: BoxDecoration(
                                                    borderRadius:BorderRadius.circular(5),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image:NetworkImage(snapshot.data[index].imagem) )
                                                  )
                                                  ,
                                                ),
                                                Text(snapshot.data[index].nomepromocao,style: 
                                                TextStyle(fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(252, 76, 2, 1)),),
                                                Padding(
                                                  padding: EdgeInsets.only(top:5 ,bottom: 5),
                                                  child: Text(snapshot.data[index].nomecasa,style: 
                                                TextStyle(fontSize: 15,
                                                fontWeight: FontWeight.w500
                                                ),),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Text("R\$ ${double.parse(snapshot.data[index].precopromo).toStringAsFixed(2).replaceAll(".", ",")}",style: 
                                                TextStyle(fontSize: 17,
                                                color: Colors.black
                                                  ),
                                                ), 
                                                    ),
                                                    Expanded(
                                                      child:Text("R\$ ${double.parse(snapshot.data[index].preconormal).toStringAsFixed(2).replaceAll(".", ",")}",style: 
                                                TextStyle(fontSize: 15,
                                                decoration: TextDecoration.lineThrough,
                                                color: Colors.grey
                                                  ),
                                                ), 
                                                    )
                                                  ],
                                                ) 
                                              ],
                                            )
                                          ) ,
                                        );
                                      });
                                    }
                              }
                            }
                        ),
                                ),
                        //         Text("Roteiros de BH - Cidade da Gastronomia",
                        //         style: TextStyle(
                        //           fontSize: 19,
                        //           color: Colors.black,
                        //           fontWeight: FontWeight.bold
                        //         )),
                        //         Container(
                        //            margin: EdgeInsets.only(top: 10),
                        //           height: 200,
                        //           child: FutureBuilder<List<Promocao>>(
                        //      future: _recuperandoPromo(context,"s"),
                        //     builder: (context,snapshot){
                        //       switch(snapshot.connectionState){
                        //         case ConnectionState.none:
                        //         case ConnectionState.waiting:
                        //           return Center(
                        //             child: CircularProgressIndicator(),
                        //           );
                        //         default:
                        //                 if(!snapshot.hasData){
                        //                   Center(
                        //                     child: Column(
                        //                       children: <Widget>[
                        //                         CircularProgressIndicator(),
                        //                         Text("Aguarde")
                        //                       ],
                        //                     ),
                        //                   );
                        //                 }else{
                        //                   return ListView.builder(
                        //                     scrollDirection: Axis.horizontal,
                        //               itemCount: snapshot.data.length,
                        //               itemBuilder: (context,index){
                        //                 return GestureDetector(
                        //                   onTap: (){
                                            
                        //                   },
                        //                   child:Container( 
                        //                     margin: EdgeInsets.all(2),
                        //                     width: 175,
                        //                     height: 50,
                        //                     decoration: BoxDecoration(
                        //                       // border: Border.all(width: 0.2,color: Colors.grey),
                        //                       borderRadius:BorderRadius.circular(5),
                        //                     ),
                        //                     child: Column(
                        //                       crossAxisAlignment: CrossAxisAlignment.start,
                        //                       children: <Widget>[
                        //                         Container(
                        //                           margin: EdgeInsets.only(bottom: 3),
                        //                           height:100 ,
                        //                           decoration: BoxDecoration(
                        //                             borderRadius:BorderRadius.circular(5),
                        //                             image: DecorationImage(
                        //                               fit: BoxFit.cover,
                        //                               image:NetworkImage(snapshot.data[index].imagem) )
                        //                           )
                        //                           ,
                        //                         ),
                        //                         Text(snapshot.data[index].nomepromocao,style: 
                        //                         TextStyle(fontSize: 12,
                        //                         fontWeight: FontWeight.bold,
                        //                         color: Color.fromRGBO(252, 76, 2, 1)),),
                                                 
                        //                       ],
                        //                     )
                        //                   ) ,
                        //                 );
                        //               });
                        //             }
                        //       }
                        //     }
                        // ),
                        //         )
                            ],
                          ),
                          )
                        ),
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
List<Promocao> promocoes = List();
Future<List<Promocao>> _recuperandoPromo(context,roteiro) async {
    try{
        http.Response response = await http.get("http://erp.addmob.com.br/listar_promocao?roteiro=$roteiro");  // REQUISIÇÃO GET 
        Map dados = json.decode(response.body); // RETORNANDO DADOS EM FORMATO JSON
        promocoes.clear();                             // LIMPANDO A LISTA
        for(var pro in dados['response']){             // PARA CADA JSON ADD EM UMA LISTA
          // GUARDANDO OS DADOS NA CLASSE PROMO
          Promocao p = Promocao(
            codregistro: pro['codregistro'],
            idpromocao: pro['idpromocao'],
            dtvalini: pro['dtvalini'],
            dtvalfim: pro['dtvalfim'],
            quantidade: pro['quantidade'],
            regra: pro['regra'],
            imagem: pro['imagem'],
            nomepromocao: pro['nomepromocao'],
            nomecasa: pro['nomecasa'],
            dtusoini: pro['dtusoini'],
            dtusofim: pro['dtusofim'],
            precopromo: pro['precoPromo'],
            preconormal: pro['precoNormal']
          );
          
          promocoes.add(p);      
    }
    
    }catch(e){
       Navigator.pushNamedAndRemoveUntil(context, "erro",(_) => false);
    }
    return promocoes;
  }

