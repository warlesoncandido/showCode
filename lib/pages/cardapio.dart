import 'dart:convert';
import 'package:cardapio_show/helpers/post.dart';
import 'package:cardapio_show/pages/sobre.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


List<Post> postagens = List();

class Cardapio extends StatefulWidget {
  @override
  _CardapioState createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {

  String _url = "http://service.addmob.com.br/appchef/data/import/?tipo=nrestaurante_chef2&latitude=0&longetudide=0";
  

  Future<List<Post>> _recuperandoRestaurante() async {

    http.Response response = await http.get(_url);

    Map dados = json.decode(response.body);
    postagens.clear();

    for(var post in dados['restaurante']){
        
      // Uint8List base64 = base64Url.decode(post['logoempresa'].toString().replaceAll("data:image/jpeg;base64,", ""));
      Post p = Post(post['razaosocial'], post['distancia'], post['quantidade_dispositivos'],
          post['site'], post['data_criacao'], post['estacionamento'],
          post['complemento'], post['data_ultima_atualizacao'], post['manobrista'],
          post['playground'], post['telefone'], post['latitude'],
          post['email'], post['descricao'], post['cnpj'],
          post['bairro'], post['numeroendereco'],post['url2'] ,
          post['nome_empresa'], post['estado'], post['codregistro'],
          post['cidade'], post['imagem_menu'], post['longitude'], post['endereco']);

      postagens.add(p);
      
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
                            margin: EdgeInsets.only(right: 2,left: 40),
                            child: Image.asset('images/icon-cardapio-show-transparente.png'),
                          ),
                          Expanded(
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

                                  return ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context,index){
                                        return GestureDetector(
                                          onTap: (){
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Sobre(snapshot.data[index])));
                                          },
                                          child: Card(
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  width:100,
                                                  height: 100,
                                                  padding: EdgeInsets.all(10),
                                                  child: Image.network(snapshot.data[index].logoempresa),
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Flexible(
                                                      flex:0,
                                                        child: Text("${snapshot.data[index].nomeempresa}",
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 20
                                                          ),
                                                        ),
                                                    ),
                                                    Text("${snapshot.data[index].telefone}"),
                                                    Text("${snapshot.data[index].site}"),
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
                        )
                    )
                  ],
                )


            )

    );
  }
}



