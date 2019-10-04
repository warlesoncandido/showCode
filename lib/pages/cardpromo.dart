import 'dart:async';
import 'dart:convert';
import 'package:cardapio_show/avisos/confirm.dart' as prefix0;
import 'package:toast/toast.dart';
import 'package:cardapio_show/avisos/confirm.dart';
import 'package:cardapio_show/helpers/cupom.dart';
import 'package:cardapio_show/helpers/promocao.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class cardpromo extends StatefulWidget {
  Promocao promo;
  cardpromo(this.promo);
  @override
  _cardpromoState createState() => _cardpromoState();
}


    var cupomgerado;

Avisos aviso = Avisos();
Cupom cupom =Cupom();

class _cardpromoState extends State<cardpromo> {
  @override
  Widget build(BuildContext context) {

    

  TextEditingController cupomController = TextEditingController();
    return Scaffold(
      body: Padding(
                padding: EdgeInsets.only(top: 25,left: 5,right: 5,bottom: 10),
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
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom:10),
                                height: 200,
                                decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:NetworkImage(alterandoBranco(widget.promo.imagem,"http://erp.addmob.com.br/static/imagens_empresas/sem_foto.png"),scale: 1.0) 
                                    )
                                )
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                
                                constraints: BoxConstraints(minWidth: 400,maxWidth: 500),
                                height:150 ,
                                color:Colors.white,
                                child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(alterandoBranco(widget.promo.nomepromocao, ""),
                                    style: TextStyle(fontSize:25,
                                    ),),
                                    Padding(
                                     padding: EdgeInsets.only(bottom:10,top: 10),
                                      child: Text(alterandoBranco(widget.promo.nomecasa, ""),
                                    style: TextStyle(fontSize:19 )),
                                    ),

                                    Text("Valido para Compras de : R\$ 40,00 a R\$ 200,00",
                                    style: TextStyle(fontSize:16 )),
                                    Padding(
                                      padding: EdgeInsets.only(bottom:10,top: 10),
                                      child: Text("Valido para uso de : ${alterandoBranco(widget.promo.dtusoini, "")} a ${alterandoBranco(widget.promo.dtusoini, "")}",
                                    style: TextStyle(fontSize:16 )),
                                    )
                                  ],

                                ),
                              ) ,
                              Container(
                                margin: EdgeInsets.only(bottom:10,top: 10),
                                padding: EdgeInsets.all(10),
                                constraints: BoxConstraints(minWidth: 400,maxWidth: 500),
                                height:150 ,
                                color:Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    Text("Descrição do Cupom:",
                                    style:TextStyle(fontSize: 19),
                                    ),
                                    Container(
                                      margin:EdgeInsets.all(5) ,
                                      child:Text(alterandoBranco(widget.promo.regra, ""),
                                    style:TextStyle(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines:5 )
                                    )
                                  ],
                                ),
                              ) ,
                              Container(
                                width: 300,
                                height: 40,
                                margin: EdgeInsets.only(bottom: 20),
                                child: RaisedButton(
                                  elevation: 4,
                                onPressed:(){
                                  cupomController.text = renovandoCupom(cupomController.text);
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                    return Container(
                                      
                                      child: AlertDialog(
                                        elevation: 3,
                                    title: Text("Clique em Comprar!",style: TextStyle(color: Colors.red,fontSize: 18),),
                                    content: 
                                              Container(
                                                
                                                 color:Color.fromRGBO(107, 119, 141, 0.1),
                                                constraints: BoxConstraints(minWidth: 100 , maxWidth: 500),
                                                child: TextField(
                                                controller: cupomController,
                                                readOnly: true,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold),
                                                decoration: InputDecoration( 
                                                  border: OutlineInputBorder(
                                                          //  borderSide: BorderSide(color: Colors.blueAccent, width: 1),
                                                          
                                                          ),
                                                ),
                                              ),
                                              ),
                                              
                                    actions: [
                                      FlatButton(
                                        child: Text("Comprar Cupom",style: TextStyle(fontSize: 16,color: Colors.green),),
                                        onPressed: (){
                                            cupom.codregistro=widget.promo.codregistro;
                                            cupom.cupom = cupomController.text;
                                            cupom.idCliente = "22";
                                            cupom.idPromocao = widget.promo.idpromocao;
                                            cupom.postarCupom();
                                            Toast.show("Esse cupom agora e seu!!",context,duration:Toast.LENGTH_LONG,gravity: Toast.BOTTOM,textColor: Colors.white);
                                        },
                                      ),
                                      FlatButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                          renovandoCupom(cupomController);
                                        },
                                        child: Text("Voltar",style: TextStyle(color: Colors.blue),),
                                      )
                                    ],
                                  ),
                                    );
                                  },
                                  );
                                } ,
                                child: Text("Eu quero um Cupom",style:TextStyle(color: Colors.white,fontSize: 17) ,),
                                color: Colors.green,
                                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                              ),
                              )
                            ],
                          )
                          ,
                        )
                    )
                  ],
                )
            )
    );
  }
}

alterandoBranco(widget ,action){
  if(widget == null || widget == ""){
      widget == action;

  }else{
    widget == widget;
  }
  return widget;
}

renovandoCupom(text){

  if(text == ""|| text == null){
      var n1 = random.nextInt(100);
      var n2 = random.nextInt(100);
      var n3 = random.nextInt(100);
      var n4 = random.nextInt(100);
      var total = utf8.encode(n1.toString() + n2.toString() + n3.toString() + n4.toString());
      var sha = sha1.convert(total);
                                            
      cupomgerado = sha.toString().substring(0,6).toUpperCase();
  }else{
  Timer.periodic(Duration(seconds: 5), (t) {
      var n1 = random.nextInt(100);
      var n2 = random.nextInt(100);
      var n3 = random.nextInt(100);
      var n4 = random.nextInt(100);
      var total = utf8.encode(n1.toString() + n2.toString() + n3.toString() + n4.toString());
      var sha = sha1.convert(total);
                                            
      cupomgerado = sha.toString().substring(0,6).toUpperCase(); 

      text = cupomgerado;
  });
  }
      return cupomgerado;                                    
}