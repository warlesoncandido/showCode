import 'dart:convert';
import 'dart:io';
import 'package:cardapio_show/helpers/post.dart';
import 'package:cardapio_show/pages/restaurante/menu_restaurante.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';

List<Post> postagens = List();
class Cardapio extends StatefulWidget {
  @override
  _CardapioState createState() => _CardapioState();
}
class _CardapioState extends State<Cardapio> {
  String _url = "http://erp.addmob.com.br/lista_restaurante";
  
  Future<List<Post>> _recuperandoRestaurante() async {
    try{
        http.Response response = await http.get(_url);
        Map dados = json.decode(response.body);
        postagens.clear();
        for(var post in dados['response']){ 
          Post rest = Post(
                            razaosocial:post['razaosocial'],
                            numeroendereco:post['numeroendereco'] ,
                            quantidadeDispositivos: post['quantidadeDispositivos'],
                            site: post['site'],
                            pais: post['pais'],
                            estacionamento: post['estacionamento'],
                            complemento: post['complemento'],
                            manobrista: post['manobrista'],
                            playground: post['playground'],
                            telefone: post['telefone'],
                            latitude: post['latitude'],
                            email: post['email'],
                            descricao: post['descricao'],
                            cnpj: post['cnpj'],
                            tipoEmpresa: post['tipoEmpresa'],
                            bairro: post['bairro'],
                            temcardapio: post['temcardapio'],
                            cep: post['cep'],
                            logoempresa: post['logoempresa'],
                            facebook: post['facebook'],
                            instagram: post['instagram'],
                            estado: post['estado'],
                            codregistro: post['codregistro'],
                            url: post['url'],
                            cidade: post['cidade'],
                            imagemMenu: post['imagemMenu'],
                            longitude: post['longitude'] ,
                            quantidadeAcessos:post['quantidadeAcessos']  ,
                            endereco: post['endereco']
          );  
          postagens.add(rest);  
    }
    }catch(e){
       if(e is SocketException) Navigator.pop(context);
    }
    return postagens;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245,1),
      body:   Padding(
                padding: EdgeInsets.only(top: 25),
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
                        child: FutureBuilder<List<Post>>(
                             future: _recuperandoRestaurante(),
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
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context,index){
                                        return GestureDetector(
                                          onTap: (){
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Menu(snapshot.data[index])));
                                          },
                                          child: Card(
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  width:100,
                                                  height: 100,
                                                  padding: EdgeInsets.all(10),
                                                  child: Image.network(snapshot.data[index].url == null || snapshot.data[index].url == "" ? "http://erp.addmob.com.br/static/imagens_empresas/sem_foto.png" : snapshot.data[index].url )
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Flexible(
                                                      flex:0,
                                                        child: Text("${snapshot.data[index].razaosocial}",
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 20
                                                          ),
                                                        ),
                                                    ),
                                                    Text("${snapshot.data[index].telefone}"),
                                                    Text(snapshot.data[index].site == null ?" " :snapshot.data[index].site),
                                                    Text("${snapshot.data[index].endereco} "+"${snapshot.data[index].numeroendereco}"),
                                                    Text("${snapshot.data[index].bairro}  / "+"${snapshot.data[index].cidade}")
                                                  ],
                                                )
                                              ],
                                            ),
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
            )
    );
  }
}



