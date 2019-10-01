import 'dart:convert';

import 'package:cardapio_show/pages/restaurante/sobre_restaurante.dart';
import 'package:http/http.dart' as http;
import 'package:cardapio_show/helpers/post.dart';
import 'package:cardapio_show/helpers/pratos.dart';
import 'package:flutter/material.dart';

class Sugestao extends StatefulWidget {
  @override
  String opcao;
  Post post;
  Sugestao(this.post,this.opcao);

  _SugestaoState createState() => _SugestaoState();
}



class _SugestaoState extends State<Sugestao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Text(widget.opcao == "sugestao" ? "SUGESTÃO DO CHEF" : "PROMOÇÃO",
                    style: TextStyle(color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),),
                    Expanded(
                      flex: 1,
                      child: FutureBuilder(
                            future: _recuperarPratos(widget.post.codregistro,widget.opcao),
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
                               return  ListView.builder(
                                 shrinkWrap: true,  
                                 itemCount: snapshot.data.length,
                                 itemBuilder: (context,index){
                                   return
                                   GestureDetector(
                                     onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Sobre_Restaurante(snapshot.data[index],widget.post)));
      
                                     },
                                     child: Card(
                                     child: Container(
                                       padding: EdgeInsets.all(10),
                                       height:200,
                                       child: Row(
                                                  children: <Widget>[
                                                     Expanded(
                                                       child: Column(
                                                       crossAxisAlignment:CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Container(
                                                          
                                                          child: Text(snapshot.data[index].nomePrato.toUpperCase(),
                                                        style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                        ),
                                                        ),
                                                        Container(
                                                          height: 70,
                                                          margin: EdgeInsets.only(top:10  , bottom: 10),
                                                          constraints: BoxConstraints(maxWidth: 500),
                                                          child: Text(
                                                            snapshot.data[index].descricaoPrato == null ? " " : snapshot.data[index].descricaoPrato,
                                                            style: TextStyle(fontSize: 15),
                                                            softWrap: true,
                                                            overflow: TextOverflow.ellipsis,
                                                            maxLines: 4,
                                                          ),
                                                        ),
                                                        Text(widget.opcao == 'promocao'? "R\$ 85,00":"",
                                                        style: TextStyle(
                                                          fontSize: 19,
                                                          decoration: TextDecoration.lineThrough
                                                        ),),
                                                        Padding(padding: EdgeInsets.all(5),),
                                                        Text( widget.opcao == 'promocao' ? "R\$ ${snapshot.data[index].preco.replaceAll(".", ",")} ":"R\$ ${snapshot.data[index].preco.replaceAll(".", ",")}",
                                                        style:
                                                         TextStyle(color:Color.fromRGBO(252, 76, 2, 1),fontSize: 25 ),
                                                         ),
                                                      ]),
                                                     ),
                                                   
                                                   Container(
                                                     margin: EdgeInsets.only(left: 3),
                                                     height: 200,
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
                                   )
                                  );
                                 },
                               );
                               } 
                              }
                            }),
                    )
                    
               ] )
    )
    );
  }
}


List<Pratos> listprato = List();
Future<List<Pratos>> _recuperarPratos(cod, opcao) async {
    http.Response response;
    try{
      if(opcao == "sugestao"){
         response = await http.get("http://erp.addmob.com.br/lista_pratos?cod_registro=$cod&sugestao=s");
      }else if(opcao == "promocao"){
        response = await http.get("http://erp.addmob.com.br/lista_pratos?cod_registro=$cod&promocao=s");
      }
      Map dados = json.decode(response.body);
      listprato.clear();
      for(var p in dados['response']){ 
        Pratos pratos = Pratos(preco:p['preco'],relacaoPrato: p['relacao_prato'],nomePrato: p['nome_prato'],descricaoPrato: p['descricao_prato'],imagemPrato: p['url'],id_produto: p['id_produto'],id_grupo: p['id_grupo'] );
        listprato.add(pratos); 
    }
    }catch(e){
       
    }
    return listprato;
  }