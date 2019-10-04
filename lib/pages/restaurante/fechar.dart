import 'dart:convert';
import 'package:cardapio_show/helpers/pedidos.dart';
import 'package:cardapio_show/helpers/post.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../promo.dart';


var mesa;
double total = 0 ;


class Fechar extends StatefulWidget {
  @override
  Post post;
  Fechar(this.post);
  _FecharState createState() => _FecharState();
}

class _FecharState extends State<Fechar> {

  @override
  Widget build(BuildContext context){
    
     
    return  Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245,1), 
      body: Padding(
          padding: EdgeInsets.fromLTRB(10, 25, 10, 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text("MESA: "  ,
                    style:TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold)
                    ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 300,
                      child: FutureBuilder<List<Pedidos>>(
                        future: _recuperandoPedidos(widget.post.codregistro,context),
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
                                            shrinkWrap: true,
                                            itemCount: snapshot.data.length,
                                            itemBuilder: (context,index){
                                              
                                            
                                             total += double.parse( snapshot.data[index].total.replaceAll(",", ".")); 
                                             
                                            
                                             
                                              
                                              return  Container(
                                                margin: EdgeInsets.only(top: 15),
                                                child: Column(
                                                  children: <Widget>[
                                                    Row(
                                                  children: <Widget>[
                                                    Expanded(child: Text(snapshot.data[index].quantidadeProduto + "x",style:
                                                    TextStyle(fontSize: 15,
                                                    fontWeight: FontWeight.bold),),),
                                                    Expanded(child: Text("R\$ "+snapshot.data[index].precoProduto,style:
                                                    TextStyle(fontSize: 15)),),
                                                    Expanded(child: Text(snapshot.data[index].idProduto,style:
                                                    TextStyle(fontSize: 15)),),
                                                    Expanded(child: Text("R\$ "+snapshot.data[index].total,style:
                                                    TextStyle(fontSize: 15)),),
                                                    
                                                    
                                                    
                                                  ],
                                                ),
                                                Divider()
                                                  ],
                                                )
                                              );   
                                            },
                                          );
                                          
                                        }
                          }
                        })
                    ),
                      Container(
                        margin: EdgeInsets.all(15),
                        
                        height: 50,
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Text("Valor Total:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                              Expanded(
                                child: Text("R\$ ${total.toStringAsFixed(2).replaceAll(".", ",")}",style: TextStyle(fontSize: 20),),
                              ),
                            ],
                          ),
                             )
                        ),
                      ),
                      Container(
                        
                        width: 350,
                        child: RaisedButton(
                          color: Colors.green,
                          child: Text("Encerrar",style:
                          TextStyle(color: Colors.white),),
                          onPressed: ()async{
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.remove("mesa");
                            prefs.remove("cod");
                            prefs.remove("idrestaurante");

                            Navigator.pop(context);
                          },
                        ),
                      ),
                        ],
                        
                      ),
                    )
                    
               ] )
    )
    );
  }
}
List<Pedidos> pedidos = List();
Future<List<Pedidos>> _recuperandoPedidos(cod,context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try{
        http.Response response = await http.get("http://erp.addmob.com.br/mesas_em_uso?codregistro=$cod&id_mesa=${prefs.getString("mesa")}&cardapio_show=");
                            var dados = json.decode(response.body);
                            pedidos.clear();
                            total = 0;
                            for(var pedido in dados){
                              Pedidos p = Pedidos(
                                pedido: pedido[3],
                                quantidadeProduto: pedido[7],
                                idProduto: pedido[9],
                                precoProduto: pedido[10].replaceAll(".",","),
                                total: pedido[15].replaceAll(".",",")
                            );
                            pedidos.add(p);
                            
                            
                        }
                        return pedidos;              
    }catch(e){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>Promo()));
    }
    
}

