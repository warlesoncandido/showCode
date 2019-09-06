import 'package:cardapio_show/helpers/post.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class Sobre extends StatefulWidget {
  
   Post data;
   Sobre(this.data);

  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
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
      
      
       Expanded(
         flex: 1,
         child:  Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            color: Colors.white,
          width: 1000,
          height: 500,
          child: PageIndicatorContainer(
            
            child:  PageView(
            
            children: <Widget>[

//  INICIO SOBRE RESTAURANTE
               Container(
                
                padding: EdgeInsets.fromLTRB(15, 15, 15, 30),
                color: Colors.white,
                width: 1000,
                height: 500,
                child:SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 100),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[


              Container(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("O Restaurante",style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),),
              GestureDetector(
                onTap: (){},
                child: Container(
                width: 200,
                height: 200,
                child: Image.network(widget.data.logoempresa),
              ),
              ),
              Text('${widget.data.razaosocial}'
                        ,style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(252, 76, 2, 1),
                          ),),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                       
                        
                        GestureDetector(
                          onTap:()async{
                            String tel = "tel:+55${widget.data.telefone}";

                            await launch(tel);
                          } ,
                          child: Padding(
                          padding: EdgeInsets.only(top: 30 , bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 15),
                                width: 20,
                                height: 20,
                                child: Image.asset('icons/phone.png'),
                              ),
                              Expanded(
                                child: Text(widget.data.telefone,
                                 style: TextStyle(fontSize: 19,
                                 fontWeight: FontWeight.bold),),
                                
                              )
                            ],
                          )
                        ),
                        ),
                        GestureDetector(
                          onTap: ()async{
                            if(widget.data.site == ""){
                              return null;
                            }else{
                              await launch("${widget.data.site}");
                              }
                          },
                          child: Padding(
                          padding: EdgeInsets.only(top: 10 , bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                             Container(
                                margin: EdgeInsets.only(right: 15),
                                width: 20,
                                height: 20,
                                child: Image.asset('icons/web.png'),
                              ),
                              Expanded(
                                child: Text(widget.data.site,
                                 style: TextStyle(fontSize: 19),),
                                
                              )
                            ],
                          )
                        ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10 , bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                             Container(
                                margin: EdgeInsets.only(right: 15),
                                width: 20,
                                height: 20,
                                child: Image.asset('icons/fb.png'),
                              ),
                              Expanded(
                                child: Text('@Restaurante',
                                 style: TextStyle(fontSize: 19),),
                                
                              )
                            ],
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10 , bottom: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                             Container(
                                margin: EdgeInsets.only(right: 15),
                                width: 20,
                                height: 20,
                                child: Image.asset('icons/inst.png'),
                              ),
                              Expanded(
                                child: Text('@Restaurante',
                                 style: TextStyle(fontSize: 19),),
                                
                              )
                            ],
                          )
                        ),
                         
                        Container(
                          padding: EdgeInsets.only(bottom: 50),
                          child: Row(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(right: 15),
                                width: 20,
                                height: 20,
                                child: Image.asset('icons/time.png'),
                              ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Seg a Qui - 11h às 23h',
                                  style: TextStyle(fontSize: 19),
                                  ),
                                  Text('Sex - 11h às 00h',
                                  style: TextStyle(fontSize: 19),),
                                  Text('Sab a Dom - 11h às 01h',
                                  style: TextStyle(fontSize: 19),),
                                ],
                              ),
                            )
                          ],
                        ),
                        )
                        
                  ],
                ),
              )
            ],
            ),
                )
              ),
              

// INICIO DO SOBRE O PRATO

              Container(
                padding: EdgeInsets.only(bottom: 30),
                child: SingleChildScrollView(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("O Prato",style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),),
              Container(
                width: 200,
                height: 200,
                child: Image.asset('images/salada.png'),
              ),
              Text('Salada com Frango Grelhado',
              style:TextStyle(
                fontSize: 18
              ) ,),
              Container(
                margin: EdgeInsets.only(top:10 ,bottom:10 ),
                child: Text('R\$100,00',
                style:TextStyle(
                  fontSize:19,
                  color:Color.fromRGBO(252, 76, 2, 1)
                )
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Text('Descrição:',
                      style:TextStyle(
                        fontSize:17,
                        fontWeight: FontWeight.bold
                      )
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15 , bottom:  15),
                        child: Text("Lorem ipsum dolor sit amet," 
                      "consectetur adipiscing elit, "
                      "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                      " Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi"
                        "ut aliquip ex ea commodo consequat.",
                      style: TextStyle(
                        fontSize: 16
                      ),),
                      ),
                      Text("Relação do prato com o tema:",
                      style:TextStyle(
                        fontSize:17,
                        fontWeight: FontWeight.bold
                      )),
                      Padding(
                        padding: EdgeInsets.only(top: 15 , bottom:  15),
                        child: Text("Lorem ipsum dolor sit amet," 
                      "consectetur adipiscing elit, "
                      "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                      " Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi"
                        "ut aliquip ex ea commodo consequat.",
                      style: TextStyle(
                        fontSize: 16
                      ),),
                      ),
                        Text("Nome do Chef :",
                      style:TextStyle(
                        fontSize:17,
                        fontWeight: FontWeight.bold
                      )),
                      Padding(
                        padding: EdgeInsets.only(top: 15 , bottom: 70),
                        child: Text("Warleson Candido da Silva",
                      style:TextStyle(fontSize: 16))
                      ),
                      
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 50),
                        height: 50,
                        child: GestureDetector(
                          child: Image.asset('images/curtir.png'),
                          onTap:(){
                            _launchURL();
                          },
                        ),
                        
                      ),
                                    
            ],
            ),
            
                )
              )
            ],
          ), 

          align: IndicatorAlign.bottom,
          length: 2,
          indicatorSpace: 10.0,
          padding: const EdgeInsets.all(10),
          indicatorColor: Colors.black,
          indicatorSelectorColor: Colors.blue,
          shape: IndicatorShape.roundRectangleShape(),
          
          )
          
          
      ),
       ),
      
      ]
      )
    )
    );
  }
}
_launchURL() async {

  
  var url ="https://www.facebook.com/";
  
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


