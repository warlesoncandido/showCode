import 'dart:convert';
import 'package:cardapio_show/helpers/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';



class Cardapio extends StatefulWidget {
  @override
  _CardapioState createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {

  String _url = "http://service.addmob.com.br/appchef/data/import/?tipo=nrestaurante_chef&latitude=0&longetudide=0";
  List<Post> postagens = List();
  Future<List<Post>> _recuperandoRestaurante() async {

    http.Response response = await http.get(_url);

    Map dados = json.decode(response.body);


    for(var post in dados['restaurante']){
      Post p = Post(post['razaosocial'], post['distancia'], post['quantidade_dispositivos'],
          post['site'], post['data_criacao'], post['estacionamento'],
          post['complemento'], post['data_ultima_atualizacao'], post['manobrista'],
          post['playground'], post['telefone'], post['latitude'],
          post['email'], post['descricao'], post['cnpj'],
          post['bairro'], post['numeroendereco'], post['logoempresa'],
          post['nome_empresa'], post['estado'], post['codregistro'],
          post['cidade'], post['imagem_menu'], post['longitude'], post['endereco']);
      postagens.add(p);
    }
    return postagens;
    print(postagens.toString());

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
                                        return CardRestaurante();
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

class CardRestaurante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            width:100,
            height: 100,
            padding: EdgeInsets.all(10),
            child: Image.asset('images/chef.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Nome Restaurante",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
              Text("(31)90000-0000"),
              Text("@restaurante"),
              Text("Rua dos Ipês,100 - Santa Efigênia")
            ],
          )
        ],
      ),
    );
  }
}


