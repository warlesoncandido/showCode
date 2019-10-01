import 'package:toast/toast.dart';
import 'package:cardapio_show/helpers/pedidos.dart';
import 'package:cardapio_show/helpers/post.dart';
import 'package:cardapio_show/helpers/pratos.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController mesaController = TextEditingController();
Pratos prato = Pratos();
Pedidos pedidos = Pedidos();
int unidade = 1;
double preco;


class Sobre_Restaurante extends StatefulWidget {
  
   Pratos data;
   Post rest;
   Sobre_Restaurante(this.data, this.rest);
  @override
  _SobreState createState() => _SobreState();
}
class _SobreState extends State<Sobre_Restaurante> {
 
 @override
  void initState(){
    
    super.initState();
    unidade = 1;
    preco = double.parse(widget.data.preco);
    
    
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: chave,
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
                                                                    icon: Icon(Icons.remove,color: Colors.red,),
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
                                                           onPressed: ()async{
                                                             SharedPreferences prefs = await SharedPreferences.getInstance();
                                                                if(prefs.getString("idrestaurante") == "" || prefs.getString("idrestaurante") == null){
                                                                prefs.setString("idrestaurante", widget.rest.codregistro);
                                                              }
                                                              else if (prefs.getString("idrestaurante") != widget.rest.codregistro){
                                                                showDialog(
                                                                context: context,
                                                                builder: (context) {
                                                                  return AlertDialog(
                                                                    title: Text('Atenção!!',style: TextStyle(color: Colors.red),textAlign: TextAlign.center,),
                                                                    content: Text('Você tem uma conta aberta em outro restaurante.'),
                                                                    actions: <Widget>[
                                                                                                                                        
                                                                    FlatButton(
                                                                      onPressed: () {
                                                                      Navigator.pop(context);
                                                                      },
                                                                      child: Text('Entendi!'),
                                                                    )
                                                                    ],
                                                                    );
                                                                });  
                                                              }else{
                                                                showDialog(
                                                                context: context,
                                                                builder: (context) {
                                                                  return AlertDialog(
                                                                    title: TextField(
                                                                      textAlign: TextAlign.center,
                                                                      keyboardType: TextInputType.number,
                                                                      controller: mesaController,
                                                                      onChanged: (text){
                                                                        text = prefs.getString("mesa");
                                                                      },
                                                                      readOnly: prefs.getString("mesa") == null || prefs.getString("mesa") == "" ? false : true,
                                                                      decoration: InputDecoration(
                                                                        labelText: prefs.getString("mesa") == null || prefs.getString("mesa") == "" ? "Confirme sua mesa" : "Sua mesa:",
                                                                        labelStyle: TextStyle(color: Colors.blue,
                                                                        
                                                                        fontSize: 20),
                                                                        border: OutlineInputBorder(
                                                                          borderSide: BorderSide(color: Colors.blueAccent, width: 32.0),
                                                                          ),
                                                                      ),
                                                                      
                                                                    ),
                                                                    content: 
                                                                        Text('PEDIR $unidade  ${widget.data.nomePrato}'),
                                                                      
                                                                    actions: <Widget>[
                                                                      FlatButton(
                                                                      onPressed:()async{
                                                                       await adiconarPedido(widget.data, widget.rest, context,);

                                                                       Navigator.pop(context);                                                                        
                                                                       
                                                                        setState(() {
                                                                         unidade = 1; 
                                                                         preco = double.parse(widget.data.preco);
                                                                        });
                                                                        
                                                                      },
                                                                      child: Text('SIM!',style: TextStyle(color: Colors.green),),
                                                                      ),
                                                                      FlatButton(
                                                                        onPressed: () {
                                                                          Navigator.pop(context);
                                                                        },
                                                                        child: Text('NÃO!',style: TextStyle(color: Colors.red)),
                                                                      ),
                                                                      ],
                                                                    );
                                                                  });                                                                                     
                                                              }
                                                                
                                                              }    
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



adiconarPedido(Pratos prato,Post restaurante,context)async{
  try{
    SharedPreferences prefs = await SharedPreferences.getInstance();
     print(prato.id_produto);
     pedidos.codPedidoVendasc = prefs.getString("cod") == "" || prefs.getString("cod") == null ? "" : prefs.getString("cod");
     pedidos.idMesa = mesaController.text;
     pedidos.idVendedor = "01";
     pedidos.quantidadeProduto = unidade.toString();
     pedidos.idProduto = prato.id_produto.toString();
     pedidos.precoProduto = prato.preco.replaceAll(".", ",");
     pedidos.quantidadeOpcional = "0";
     pedidos.idOpcional = "0";
     pedidos.precoOpcional = "0";
     pedidos.idCelular = "25";
     pedidos.idCliente = "15";
                                                
     pedidos.fazendoPedido(restaurante.codregistro,context);
     prefs.setString("mesa", mesaController.text);
     pedidos.setItem();
  }catch (e){  
  }    
}
        
                                                                                                            



