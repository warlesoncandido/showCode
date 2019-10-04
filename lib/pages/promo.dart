import 'dart:convert';
import 'dart:io';
import 'package:cardapio_show/helpers/promocao.dart';
import 'package:cardapio_show/pages/cardapio.dart';
import 'package:cardapio_show/pages/cardpromo.dart';
import 'package:cardapio_show/pages/error.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Promo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]); 
    return Scaffold(
      
      backgroundColor: Color.fromRGBO(245, 245, 245,1),
      body:  Padding(
                padding: EdgeInsets.only(top: 25,left: 10 , right: 10),
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
                        child: Container( 
                          child: SingleChildScrollView(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Hoje quero:",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                )),
                                Container( 
                                  height: 250,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(top: 30,bottom: 30),
                                          child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: GestureDetector(
                                              child: Column(
                                              children: <Widget>[
                                                Container(
                                                  height: 70,
                                                  width: 70,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage("https://www.estadosecapitaisdobrasil.com/wp-content/uploads/2015/02/arroz-carreteiro.jpg"),
                                                  ),
                                                ),
                                                Text("Mineira")
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio("1")));
                                            },
                                            )
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              child: Column(
                                              children: <Widget>[
                                                Container(
                                                  height: 70,
                                                  width: 70,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage("https://www.portaldofranchising.com.br/wp-content/uploads/2016/05/franquias-de-bebidas1.jpg"),
                                                  ),
                                                ),
                                                Text("Bebidas")
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio("7")));
                                            },
                                            )
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              child: Column(
                                              children: <Widget>[
                                                Container(
                                                  height: 70,
                                                  width: 70,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage("http://www.dicassaopaulo.com.br/wp-content/uploads/2015/09/600x400xvirado-0.jpeg.pagespeed.ic.4rlOVnVf3j.jpg"),
                                                  ),
                                                ),
                                                Text("Paulista")
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio("2")));
                                            },
                                            )
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              child: Column(
                                              children: <Widget>[
                                                Container(
                                                  height: 70,
                                                  width: 70,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage("http://www.irmaosgaspar.com.br/images/bifedechorizoirmaosgaspar.jpg"),
                                                  ),
                                                ),
                                                Text("Argentina")
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio("3")));
                                            },
                                            )
                                          ), 
                                        ],
                                      ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 20),
                                        child: Row(
                                        children: <Widget>[ 
                                          Expanded(
                                            child: GestureDetector(
                                              child: Column(
                                              children: <Widget>[
                                                Container(
                                                  height: 70,
                                                  width: 70,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage("http://moinhoglobo.com.br/wp-content/uploads/2019/02/01-massa-pizza.png"),
                                                  ),
                                                ),
                                                Text("Pizzaria")
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio("4")));
                                            },
                                            )
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              child: Column(
                                              children: <Widget>[
                                                Container(
                                                  height: 70,
                                                  width: 70,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage("https://abrilvejario.files.wordpress.com/2017/12/1-foto-2-notas-le-max_duro-de-matar.jpg?quality=70&strip=info&w=1024"),
                                                  ),
                                                ),
                                                Text("Hamburgueria")
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio("5")));
                                            },
                                            )
                                          ),
                                         Expanded(
                                            child: GestureDetector(
                                              child: Column(
                                              children: <Widget>[
                                                Container(
                                                  height: 70,
                                                  width: 70,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage("https://www.360meridianos.com/wp-content/uploads/2017/06/guay-jub-comida-tailandesa.jpg"),
                                                  ),
                                                ),
                                                Text("Tailandesa")
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio("6")));
                                            },
                                            )
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              child: Column(
                                              children: <Widget>[
                                                Container(
                                                  height: 70,
                                                  width: 70,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage("https://rodoviariaonline.com.br/wp-content/uploads/2018/10/voce-nao-pode-deixar-passar-festas-4-comidas-tipicas-de-salvador-4-640x427.jpg"),
                                                  ),
                                                ),
                                                Text("Baiana")
                                              ],
                                            ),
                                            onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardapio("8")));
                                            },
                                            )
                                          ), 
                                        ],
                                      ),
                                      )
                                    ],
                                  ),
                                ),
                                // Divider **Promoções**//
                                Text("Promoção",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                )),
                                Container(
                                   margin: EdgeInsets.only(top: 10),
                                  height: 200,
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
                                            scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context,index){
                                        return GestureDetector(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>cardpromo(snapshot.data[index])));
                                          },
                                          child:Container( 
                                            margin: EdgeInsets.all(2),
                                            width: 175,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              // border: Border.all(width: 0.2,color: Colors.grey),
                                              borderRadius:BorderRadius.circular(5),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 3),
                                                  height:100 ,
                                                  decoration: BoxDecoration(
                                                    borderRadius:BorderRadius.circular(5),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image:NetworkImage(snapshot.data[index].imagem) )
                                                  )
                                                  ,
                                                ),
                                                Text(snapshot.data[index].nomepromocao,style: 
                                                TextStyle(fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(252, 76, 2, 1)),),
                                                Padding(
                                                  padding: EdgeInsets.only(top:5 ,bottom: 5),
                                                  child: Text(snapshot.data[index].nomecasa,style: 
                                                TextStyle(fontSize: 15,
                                                fontWeight: FontWeight.bold
                                                ),),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Text("R\$ 58,00",style: 
                                                TextStyle(fontSize: 17,
                                                color: Colors.black
                                                  ),
                                                ), 
                                                    ),
                                                    Expanded(
                                                      child:Text("R\$ 98,00",style: 
                                                TextStyle(fontSize: 15,
                                                decoration: TextDecoration.lineThrough,
                                                color: Colors.grey
                                                  ),
                                                ), 
                                                    )
                                                  ],
                                                ) 
                                              ],
                                            )
                                          ) ,
                                        );
                                      });
                                    }
                              }
                            }
                        ),
                                )
                            ],
                          ),
                          )
                        ),
                    )
                  ],
                )
            )
    );
  }
}
List<Promocao> promocoes = List();
Future<List<Promocao>> _recuperandoPromo(context) async {
    try{
        http.Response response = await http.get("http://erp.addmob.com.br/listar_promocao");  // REQUISIÇÃO GET 
        Map dados = json.decode(response.body); // RETORNANDO DADOS EM FORMATO JSON
        promocoes.clear();                             // LIMPANDO A LISTA
        for(var pro in dados['response']){             // PARA CADA JSON ADD EM UMA LISTA
          // GUARDANDO OS DADOS NA CLASSE PROMO
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
            dtusofim: pro['dtusofim']
          );
          
          promocoes.add(p);      
    }
    
    }catch(e){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>Erro()));
    }
    return promocoes;
  }