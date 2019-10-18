import 'dart:convert';
import 'package:cardapio_show/helpers/post.dart';
import 'package:cardapio_show/pages/restaurante/rest_sobre_restaurante.dart' as prefix1;
import 'package:http/http.dart' as http;
import 'package:cardapio_show/helpers/pratos.dart';
import 'package:flutter/material.dart';



 class Pages extends StatefulWidget {

   String id;  // RECUPERANDO ID DO GRUPO  DA PAGINA ANTERIOR
   Post res;    // RECUPERANDO DADOS DO RESTAURANTE DA PAGINA ANTERIOR
   String nome; // RECUPERANDO O NOME DO GRUPO DA PAGINA ANTERIOR
    Pages(this.nome,this.res,this.id);

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {

  // REQUISIÇÃO HTTP QUE RETORNA OS PRATOS DOS GRUPOS DESEJADOS
List<Pratos> prato = List();
Future<List<Pratos>> _recuperarPratos(cod,id) async {
    try{
      http.Response response = await http.get("http://erp.addmob.com.br/lista_pratos?cod_registro=$cod&idgrupo=$id"); // REQUISIÇÃO GET
      Map dados = json.decode(response.body); // RETORNANDO DADOS EM FORMATO JSON
      prato.clear();  // LIMPANDO LISTA DE PRATOS
      for(var p in dados['response']){  // PARA CADA PRATO ENCONTRADO ADICIONE A LISTA
        Pratos pratos = Pratos(preco:p['preco'],relacaoPrato: p['relacao_prato'],nomePrato: p['nome_prato'],descricaoPrato: p['descricao_prato'],imagemPrato: p['url'],idProduto: p['id_produto'],idGrupo: p['id_grupo'] );
        prato.add(pratos);    
      }
    }catch(e){
       Navigator.pushNamedAndRemoveUntil(context, "erro",(_) => false);
    }
    return prato;
  }

  @override
  Widget build(BuildContext context) {
      // INICIO DE LAYOUT
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
                  future: _recuperarPratos(widget.res.codregistro,widget.id),
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
                                                child: Container(
                                                  height: 200,
                                                  padding: EdgeInsets.all(5),
                                                  child: Column(
                                                    children: <Widget>[
                                                     GestureDetector(
                                                onTap: (){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>prefix1.Sobre_Restaurante(snapshot.data[index],widget.res)));
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
                                                          height: 50,
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
                                                     height: 190,
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



  
