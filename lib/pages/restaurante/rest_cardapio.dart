import 'dart:convert';
import 'dart:io';
import 'package:cardapio_show/helpers/post.dart';
import 'package:cardapio_show/pages/restaurante/pages.dart';
import 'package:http/http.dart' as http;
import 'package:cardapio_show/helpers/grupos.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';


class Res_Cardapio extends StatefulWidget {
    Post data;
    Res_Cardapio(this.data);
  @override
  _Res_CardapioState createState() => _Res_CardapioState();
}

class _Res_CardapioState extends State<Res_Cardapio> {
  @override
  
  int quantidade;


  Widget build(BuildContext context) {
  
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: 25, left: 5, right:5 , bottom: 5 ),
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
                    child: FutureBuilder<List<Grupos>>(
                  future: _recuperandoGrupos(widget.data.codregistro),
                  builder: (context,snapshot){
                     switch(snapshot.connectionState){
                                case ConnectionState.none:
                                case ConnectionState.waiting:
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                  default:
                                  if(!snapshot.hasData || snapshot.data.length == 0 ){
                                    return Center(child: CircularProgressIndicator());
                                  }
                                  else{
                                    return PageIndicatorContainer(
                                      length: snapshot.data.length,
                                      indicatorColor: Colors.black,
                                      indicatorSelectorColor: Colors.blue,
                                      
                                      child: PageView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context,index){
                                        return  
                                              Pages(snapshot.data[index].nomeGrupo,widget.data.codregistro,snapshot.data[index].idGrupo);
                                              
                                            
                                        
                                      },
                                    ),
                                    );

                                                  
                    }
                      
                  }
               }
             ),
                  )
                    
                ],
              ),
            
          )
        );
    
  }
}

// FUNCAO DE RETORNO DE GRUPOS
 List<Grupos> grupos = List();
 Future<List<Grupos>> _recuperandoGrupos(cod) async {
    try{
      http.Response response = await http.get("http://erp.addmob.com.br/listar_grupos?cod_registro=$cod");
    Map dados = json.decode(response.body);
    grupos.clear();

    for(var g in dados['response']){ 
        if(g['filhos'].length == 0){
          Grupos tabs = Grupos(
            g['id_grupo'],
            g['nome_grupo'],
            );
            grupos.add(tabs);
        } else{
          for (var f in g['filhos']){
            Grupos tabs = Grupos(
            f['id_grupo'],
            g['nome_grupo']+" / "+f['nome_grupo'],
            );
            grupos.add(tabs);
          }
        } 
    }
      
    }catch(e){
       if(e is SocketException) e.message;
    }
    return grupos;
  }