import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'cardapio.dart';
var maskFormatter = new MaskTextInputFormatter(mask: '(##)#####-####', filter: { "#": RegExp(r'[0-9]') });
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
    
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245,1),
      body: SingleChildScrollView(
        child: Center(
          child:
          Padding(
            padding: EdgeInsets.only(left: 25,right: 25,top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15,bottom: 15),
                  child: Text("CARDÁPIO SHOW",
                    style: TextStyle(color: Color.fromRGBO(252, 76, 2, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.bold)
                    ,),
                ),Container(
                  width: 110,
                  height: 110,
                  child: Image.asset('images/icon-cardapio-show-transparente.png'),
                  margin: EdgeInsets.only(bottom: 15),
                ),

                Container(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Text("Os melhores sabores estão aqui.Sirva-se!",
                    style: TextStyle(fontSize: 18),),
                ),
                Container(
                    height: 40,
                    width: 300,
                    margin: EdgeInsets.only(bottom: 10,),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 15.0,
                        
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.black,
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: Icon(Icons.person_pin,color: Colors.black,),
                          hintText: "Nome",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent, width: 32.0),
                              borderRadius: BorderRadius.circular(25.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 32.0),
                              borderRadius: BorderRadius.circular(25.0))
                      ),
                    )



                ),
                Container(
                  height: 60,
                  width: 300,
                  
                   margin: EdgeInsets.only(bottom: 50),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 14,
                    inputFormatters: [maskFormatter],
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                    decoration:
                    InputDecoration(
                        
                        fillColor: Colors.black,
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        prefixIcon: Icon(Icons.phone,color: Colors.black,),
                        hintText: "(31)90000-0000",
                        
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent, width: 32.0),
                            borderRadius: BorderRadius.circular(25.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 32.0),
                            borderRadius: BorderRadius.circular(25.0))
                    ),

                  ),
                ),
                Container(
                  height: 50,
                  width: 200,
                  margin: EdgeInsets.only(bottom: 50),
                  child: RaisedButton(
                    color: Color.fromRGBO(252, 76, 2, 1),

                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cardapio()),
                      );
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "ENTRAR",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              Container(
                width: 300,
                child: Image.asset('images/prato.png'),
              )
              ],
              
            ),
          ),
        ),
      )
    );
  }
}