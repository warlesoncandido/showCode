import 'package:cardapio_show/helpers/user.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'cadastro.dart';


var maskFormatter = new MaskTextInputFormatter(mask: '(##)#####-####', filter: { "#": RegExp(r'[0-9]') });
TextEditingController loginController = TextEditingController();
TextEditingController senhaController = TextEditingController();
User user = User();
class Loginv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image:DecorationImage(
                fit: BoxFit.fill,
                image:AssetImage("images/bg.png") ) ),
            child: Container(
              color: Color.fromRGBO(249, 249, 249, 0.7),
            ),        
            ),
          Center(
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
                 Container(
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[      
                  Container(
                    height: 70,
                    width: 70,
                            // ,
                    child: Image.asset('images/icon-cardapio-show-transparente.png'),
                    ),
                   Text("CARDÁPIO SHOW",
                      style:TextStyle(
                      color: Color.fromRGBO(252, 76, 2, 1)
                      ,fontSize: 25,
                      fontWeight: FontWeight.bold) ,),
                          
                        ],
                      ),
              ),
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
                        autofocus:true,
                        textAlign: TextAlign.left,
                        inputFormatters: [maskFormatter],
                        keyboardType: TextInputType.number,
                        controller: loginController,
                        decoration: InputDecoration(
                          hintText: "(31)99999-9999",
                          border: InputBorder.none
                          
                        ),
                        
                    ),
                    )
                  )
                ],
              ),
            ),
            
            Padding(padding: EdgeInsets.all(5),),
            // INPUT SENHA

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
                    child: Icon(Icons.lock,color: Colors.black,),
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
                        controller: senhaController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "********",
                          border: InputBorder.none
                        ),
                    ),
                    )
                  )
                ],
              ),
            ),
              
            Padding(padding: EdgeInsets.all(15),),
            Container(
              constraints: BoxConstraints(
                minWidth: 200,
                maxWidth: 500
              ),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),
              child: RaisedButton(
              onPressed: (){
                
                  user.phone = loginController.text;
                  user.senha =  senhaController.text;
                  user.login(context);
                  clearFields();

              },
              color: Colors.green,
              child: Text("Entrar",
              style:TextStyle(color: Colors.white) ,),
            ),
            ),
            Container(
              constraints: BoxConstraints(
                minWidth: 200,
                maxWidth: 500
              ),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),
              child: RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cadastro()));
              },
              color: Color.fromRGBO(252, 76, 2, 1),
              child: Text("Cadastrar",
              style:TextStyle(color: Colors.white) ,),
            ),
            ),
            FlatButton(
              child: Text("Ops!!Esqueci minha senha :(",style:TextStyle(color: Colors.red)),
              onPressed: (){
                Navigator.pushNamed(context, "recuperar");
              },
            )
          ]
        ),
        )
      )
        ],
      ),
    );
  }
}

clearFields(){
  if(loginController.text.isEmpty){
    senhaController.clear();
  }else{
    loginController.clearComposing();
    senhaController.clear();
  }
  
}