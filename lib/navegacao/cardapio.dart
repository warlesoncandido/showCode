import 'dart:convert';
import 'dart:io';
import 'package:cardapio_show/helpers/post.dart';
import 'package:cardapio_show/helpers/user.dart';
import 'package:cardapio_show/pages/drawer/drawer.dart';
import 'package:cardapio_show/pages/restaurante/menu_restaurante.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


User user = User();

class Cardapio extends StatefulWidget {

  String idgosto;
  Cardapio(this.idgosto);
  @override
  _CardapioState createState() => _CardapioState();
}
class _CardapioState extends State<Cardapio> {

  // REQUISIÇÃO HTTP PARA RECUPERAR OS RETAURANTES
  

// INCIO DE LAYOUT

  @override
  Widget build(BuildContext context) {
    user.verificandoUsuario(context);
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
                             future: _recuperandoRestaurante(context,widget.idgosto),
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
                                          onTap: (){
                                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Menu(snapshot.data[index])));
                                          },
                                          child: Card(
                                            elevation: 5,
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
List<Post> postagens = List();
Future<List<Post>> _recuperandoRestaurante(context,idgosto) async {
    try{
        http.Response response = await http.get("http://erp.addmob.com.br/listar_gosto?id_gosto=$idgosto");  // REQUISIÇÃO GET 
        Map dados = json.decode(response.body);         // RETORNANDO DADOS EM FORMATO JSON
        postagens.clear();                              // LIMPANDO A LISTA
        var lista = dados['response'];
        for(var p in lista){             // PARA CADA JSON ADD EM UMA LISTA
          
            // GUARDADNDO OS DADOS NA CLASSE POST
            
          Post post = Post();

          post.razaosocial = p['razaosocial'];
          post.tipoEmpresa = p['tipo_empresa'];
          post.bairro = p['bairro'];
          post.numeroendereco = p['numeroendereco'];
          post.site = p['site'];
          post.url = p['logoempresa'];
          post.cep = p['cep'];
          post.complemento = p['complemento'];
          post.estado = p['estado'];
          post.codregistro = p['codregistro'];
          post.endereco = p['end'];
          post.cidade = p['cidade'];
          post.telefone = p['telefone'];
          post.email = p['email'];
          post.facebook = p['facebook'];
          postagens.add(post); 
          
             
      }
    }catch(e){
        if(e is SocketException){
          Navigator.pushNamedAndRemoveUntil(context, "erro",(_) => false);
        }
     }
    return postagens;
  }
  


