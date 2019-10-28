import 'dart:convert';
import 'package:cardapio_show/helpers/circuito.dart';
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
                              Text("Tipos de Culinária",
                                style: TextStyle(
                                  fontSize: 17,
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
                                                FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text("Mineira",style: 
                                                TextStyle(fontSize: 13 ),
                                                maxLines: 1,),
                                                )
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio(idgosto :"1")));
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
                                                FittedBox(
                                                  child: Text("Contemporânea",style: 
                                                TextStyle(fontSize: 13 ),
                                                maxLines: 1,),
                                                )
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio(idgosto :"3")));
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
                                                FittedBox(
                                                  child: Text("Peixes",style: 
                                                TextStyle(fontSize: 13 ),
                                                maxLines: 1,
                                                ),
                                                )
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio(idgosto :"4")));
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
                                                FittedBox(
                                                  child: Text("Bar / Petisco",style: 
                                                TextStyle(fontSize: 13 ),
                                                maxLines: 1,
                                                ),
                                                )
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio(idgosto :"5")));
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
                                                FittedBox(
                                                  child: Text("Pizza",style: 
                                                TextStyle(fontSize: 13 ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,),
                                                )
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio(idgosto :"6")));
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
                                                FittedBox(
                                                  child: Text("Hamburgueria",style: 
                                                TextStyle(fontSize: 13 ),
                                                maxLines: 1,),
                                                )
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio(idgosto :"7")));
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
                                                FittedBox(
                                                  child: Text("Brasileira",style: 
                                                TextStyle(fontSize: 13 ),
                                                maxLines: 1,),
                                                )
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio(idgosto :"8")));
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
                                                FittedBox(
                                                  child: Text("Japonesa",style: 
                                                TextStyle(fontSize: 13 ),
                                                maxLines: 1,
                                                ),
                                                )
                                              ],
                                            ),
                                            onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio(idgosto : "2")));
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
                                Text("Cupons de Desconto",
                                style: TextStyle(
                                  fontSize: 17,
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
                                Text("Roteiros de BH - Cidade da Gastronomia",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400
                                )),
                                Container(
                                   margin: EdgeInsets.only(top: 20),
                                  height: 200,
                                  child: FutureBuilder<List<Circuito>>(
                             future: _recuperandoCircuito(context),
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
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio(idcircuito: snapshot.data[index].id,)));
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
                                                Text(snapshot.data[index].nome,style: 
                                                TextStyle(fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(252, 76, 2, 1)),),
                                                 
                                              ],
                                            )
                                          ) ,
                                        );
                                      });
                                       }
                                      }
                                    }
                                  ),
                                )
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

// REQUISIÇÃO DAS PROMOÇÕES
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

// REQUISIÇÃO DE CIRCUITOS

List<Circuito> circuitos = List();
Future<List<Circuito>> _recuperandoCircuito(context) async {
    try{
        http.Response response = await http.get("http://erp.addmob.com.br/recuperar_circuito");  // REQUISIÇÃO GET 
        Map dados = json.decode(response.body); // RETORNANDO DADOS EM FORMATO JSON
        circuitos.clear();                             // LIMPANDO A LISTA
        for(var c in dados['response']){             // PARA CADA JSON ADD EM UMA LISTA
          // GUARDANDO OS DADOS NA CLASSE PROMO
          Circuito circ = Circuito(
            id: c['id'],
            nome: c['nome'],
            imagem : c['imagem']
          );
          
          circuitos.add(circ);      
    }
    
    }catch(e){
       Navigator.pushNamedAndRemoveUntil(context, "erro",(_) => false);
    }
    return circuitos;
  }