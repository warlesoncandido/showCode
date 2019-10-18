import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cardapio_show/helpers/promocao.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'drawer.dart';



class DrawerCupons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245,1),
      body:   Padding(
                padding: EdgeInsets.only(top: 25,left: 10,right: 10),
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
                        child: Text("Meus Cupons",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      )
                        ],
                      )
                    ),
                    Expanded(
                        flex: 1,
                        child: FutureBuilder<List<Promocao>>(
                             future: _recuperandoPromo(context),
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
                                            scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context,index){
                                        return GestureDetector(
                                          child: Card(
                                            elevation: 5,
                                            child: Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(snapshot.data[index].nomecasa.toUpperCase(),
                                                      style: TextStyle(
                                                        fontSize: 14
                                                      ),),
                                                      Padding(padding: EdgeInsets.all(3),),
                                                      Text(snapshot.data[index].nomepromocao,
                                                      style: TextStyle(
                                                        fontSize: 14
                                                      ),),
                                                      Padding(padding: EdgeInsets.all(3),),
                                                      Row(
                                                        children: <Widget>[
                                                          Text("Cupom : ",
                                                          style: TextStyle(
                                                            fontSize:20 ),),
                                                          Text(snapshot.data[index].cupom,
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.w400
                                                        ),),
                                                        ],
                                                      ),
                                                      Padding(padding: EdgeInsets.all(5),),
                                                      Row(
                                                        children: <Widget>[
                                                          Text("Validade: "),
                                                          Text(snapshot.data[index].dtusoini+" até " +snapshot.data[index].dtusofim )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(3),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(snapshot.data[index].imagem) 
                                                      )
                                                  ),
                                                )
                                              ],
                                            ),
                                            )
                                          ),
                                        );
                                      });
                                    }
                              }
                            }
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

List<Promocao> promo = List();
Future<List<Promocao>> _recuperandoPromo(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
   try{
      http.Response response = await http.get("http://erp.addmob.com.br/listar_cupom?idcliente=${prefs.getString("idUser")}");  // REQUISIÇÃO GET 
    Map dados = json.decode(response.body);         // RETORNANDO DADOS EM FORMATO JSON
    promo.clear();                              // LIMPANDO A LISTA
    for(var pro in dados['response']){
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
            preconormal: pro['precoNormal'],
            cupom: pro['cupom']
          );
    promo.add(p);
   }
    }catch(e){
     Navigator.pushNamedAndRemoveUntil(context, "erro",(_) => false);
   }  
  return promo;       
}