import 'dart:convert';
import 'dart:io';
import 'package:cardapio_show/pages/restaurante/sobre_restaurante.dart' as prefix1;
import 'package:http/http.dart' as http;
import 'package:cardapio_show/helpers/pratos.dart';
import 'package:flutter/material.dart';


 class Pages extends StatefulWidget {

   String id;
   String cod;
   String nome;
    Pages(this.nome,this.cod,this.id);

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.only(bottom: 25),
      child:  Column(
        children: <Widget>[
            Text(widget.nome,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold),), 
            Expanded(
              
              child: FutureBuilder<List<Pratos>>(
                  future: _recuperarPratos(widget.cod,widget.id),
                  builder: (context,snapshot){
                     switch(snapshot.connectionState){
                                case ConnectionState.none:
                                case ConnectionState.waiting:
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                  default:
                                  if(!snapshot.hasData || snapshot.data.length == 0 ){
                                    return Center(child: 
                                        Text("Não há produtos nessa Categoria",
                                        style: TextStyle(fontSize: 25),
                                        ),
                                      );
                                  }
                                  else{
                                    return 
                                      ListView.builder(
                                        shrinkWrap: true,
                                      itemCount: snapshot.data.length,
                                      itemBuilder:(context,index){
                                          return  Container(
                                            //  INICIO DO CARD PRODUTOS
                                              child: Card(
                                                
                                                elevation: 5,
                                                borderOnForeground: true,
                                                child: Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Column(
                                                    children: <Widget>[
                                                     GestureDetector(
                                                onTap: (){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>prefix1.Sobre_Restaurante(snapshot.data[index])));
                                                },
                                                child:
                                                      Row(
                                                  children: <Widget>[
                                                     Expanded(
                                                       child: Column(
                                                       crossAxisAlignment:CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(snapshot.data[index].nomePrato.toUpperCase(),
                                                        style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                                                        Container(
                                                          height: 70,
                                                          margin: EdgeInsets.only(top:10  , bottom: 10),
                                                          constraints: BoxConstraints(maxWidth: 500),
                                                          child: Text(
                                                            snapshot.data[index].descricaoPrato == null ? " " : snapshot.data[index].descricaoPrato,
                                                            style: TextStyle(fontSize: 15),
                                                            softWrap: true,
                                                            overflow: TextOverflow.ellipsis,
                                                            maxLines: 3,
                                                          ),
                                                        ),
                                                        Text("R\$ ${snapshot.data[index].preco.replaceAll(".", ",")}",
                                                        style:
                                                         TextStyle(color:Color.fromRGBO(252, 76, 2, 1),fontSize: 20 ),
                                                         ),
                                                        
                                                      
                                                        
                                                      ]),
                                                     ),
                                                   
                                                   Container(
                                                     margin: EdgeInsets.only(left: 3),
                                                     height: 100,
                                                     width: 120,
                                                     decoration: BoxDecoration(
                                                       borderRadius: BorderRadius.circular(10),
                                                       image: DecorationImage(
                                                         fit: BoxFit.cover,
                                                         image:NetworkImage(snapshot.data[index].imagemPrato == null || snapshot.data[index].imagemPrato == "" ? "http://erp.addmob.com.br/static/imagens_empresas/sem_foto.png":snapshot.data[index].imagemPrato, )
                                                     ),
                                                     ),
                                                   )

                                                  ],
                                                ),
                                                     ),
                                                
                                                
                                                    ],
                                                  )
                                                )
                                              ),
                                            );
                                          
                        },
                      );
                                    
                    }
                      
                  }
               }
             ),
            )
   
        ],
      )
    );
  }
}

// FUNÇÃO DE RETORNO DE PRATOS
List<Pratos> prato = List();
Future<List<Pratos>> _recuperarPratos(cod,id) async {
    try{
      http.Response response = await http.get("http://erp.addmob.com.br/lista_pratos?cod_registro=$cod&idgrupo=$id");
      Map dados = json.decode(response.body);
      prato.clear();
      for(var p in dados['response']){ 
        Pratos pratos = Pratos(preco:p['preco'],relacaoPrato: p['relacao_prato'],nomePrato: p['nome_prato'],descricaoPrato: p['descricao_prato'],imagemPrato: p['url'],id_produto: p['id_produto'],id_grupo: p['id_grupo'] );
        prato.add(pratos);
        
    }
    }catch(e){
       if(e is SocketException) e.message;
    }
    return prato;
  }

  
