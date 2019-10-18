import 'package:cardapio_show/helpers/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';



var maskFormatter = new MaskTextInputFormatter(mask: '(##)#####-####', filter: { "#": RegExp(r'[0-9]') });
String msg = "";
TextEditingController telefoneController ;

class Recuperar extends StatefulWidget {
  @override
  _RecuperarState createState() => _RecuperarState();

}

class _RecuperarState extends State<Recuperar> {
 

   @override
  void initState() {
    telefoneController = TextEditingController();
    telefoneController.addListener(() {
      setState(() {
        
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    telefoneController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
       backgroundColor: Color.fromRGBO(245, 245, 245,1),
      body:   Padding(
                padding: EdgeInsets.only(top: 25,left: 5,right: 5),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Digite seu telefone",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w400
                            ),),
                            Padding(padding: EdgeInsets.all(10),),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1
                                ),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 50,
                                    height: 47,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(topLeft:Radius.circular(10),bottomLeft:Radius.circular(10))
                                      ),
                                    child: Icon(Icons.phone,color: Colors.black,),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      height: 47,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(topRight:Radius.circular(10),bottomRight:Radius.circular(10))
                                      ),
                                      child: TextFormField(
                                        textAlign: TextAlign.left,
                                        inputFormatters: [maskFormatter],
                                        keyboardType: TextInputType.number,
                                        controller: telefoneController,
                                        decoration: InputDecoration(
                                          hintText: "(99)99999-9999",
                                          border: InputBorder.none
                                          
                                        ),
                                        
                                    ),
                                    )
                                  )
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(5),),
                            Container(
                              constraints: BoxConstraints(
                                minWidth: 250,
                                maxWidth: 500
                              ),
                              child: RaisedButton(
                                color: Colors.blue,
                                child: Text("Enviar E-mail",
                                style: TextStyle(color: Colors.white),),
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey)
                                ),
                                onPressed: (){
                                  User user = User();
                                  user.phone = telefoneController.text.replaceAll("(", "").replaceAll(")", "").replaceAll("-", "");
                                  user.recuperando(context);

                                  telefoneController.clear();
                                },
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(5),),
                            Text(msg)
                          ],
                        )
                    ) 
                  ],
                )
            ), 
    );
  }
}

