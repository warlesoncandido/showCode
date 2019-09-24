import 'package:cardapio_show/avisos/confirm.dart';
import 'package:cardapio_show/avisos/confirm.dart' as prefix0;
import 'package:cardapio_show/helpers/pratos.dart';
import 'package:flutter/material.dart';

Pratos prato = Pratos();

int unidade = 1;
double preco;

GlobalKey key = GlobalKey();

TextEditingController controller;
class Sobre_Restaurante extends StatefulWidget {
   Pratos data;
   Sobre_Restaurante(this.data);
  @override
  _SobreState createState() => _SobreState();
}
class _SobreState extends State<Sobre_Restaurante> {
 
 @override
  void initState() {
    
    super.initState();
    unidade = 1;
    preco = double.parse(widget.data.preco);
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245,1), 
      body: Padding(
          padding: EdgeInsets.fromLTRB(10, 25, 10, 2),
          child: SingleChildScrollView(
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
                    Container(
                      padding: EdgeInsets.all(10),
                      child:Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top:10 ,bottom: 10),
                            width: 300,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image:NetworkImage(widget.data.imagemPrato == null || widget.data.imagemPrato == "" ? "http://erp.addmob.com.br/static/imagens_empresas/sem_foto.png" : widget.data.imagemPrato) )
                            ),
                          ),
                          Text(widget.data.nomePrato == null || widget.data.nomePrato =="" ? "": widget.data.nomePrato,
                          style: TextStyle(fontSize: 19),),
                          Divider(),
                          Container(
                            height: 150,
                            child: Text(widget.data.descricaoPrato == null || widget.data.descricaoPrato =="" ? "": widget.data.descricaoPrato,
                          style: TextStyle(fontSize: 16 , color: Color.fromRGBO(115, 133, 152, 1)),),
                          ),
                          Row(
                                                          children: <Widget>[
                                                            Container(
                                                              margin: EdgeInsets.only(right: 15),
                                                              color: Color.fromRGBO(236, 244, 243, 0.6),
                                                              child: Row(
                                                                children: <Widget>[
                                                                  IconButton(
                                                                    icon: Icon(Icons.remove,color: Colors.red,key: key,),
                                                                    onPressed:(){
                                                                      setState(() {
                                                                        if(unidade == 1){
                                                                          return null;
                                                                        
                                                                        } 
                                                                        else unidade--; 
                                                                        preco = unidade * double.parse(widget.data.preco);
                                                                      });
                                                                    }
                                                                  ),
                                                                  Text("$unidade"),
                                                                  IconButton(
                                                                    icon: Icon(Icons.add,color: Colors.red,),
                                                                    onPressed:(){

                                                                        setState(() {
                                                                          unidade++; 
                                                                          preco = unidade * double.parse(widget.data.preco);
                                                                        });
                                                                    },
                                                                    ),

                                                                  
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                
                                                                child: RaisedButton(
                                                           color: Colors.red,
                                                           textColor: Colors.white,
                                                           child: Text("Adicionar"),
                                                           onPressed: (){

                                                             Avisos aviso = Avisos(
                                                               mensagem: unidade == 0 ? "Fazer pedido ${widget.data.nomePrato}?":"Fazer pedido de $unidade ${widget.data.nomePrato}"
                                                              );
                                                                aviso.confirmMesa(context);
                                                            
                                                           },
                                                         ), 
                                                              )
                                                            )
                                                          ],
                                                          ),
                                      Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: Text("R\$ ${format(preco).replaceAll(".", ",")}",
                                        style: TextStyle(fontSize: 30,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),),
                                      )
                        ],
                      ) ,
                    )
               ] 
              ),
          )
        )
      );
    }
  }

  String format(double n) {
    
  return n.toStringAsFixed(2);
}