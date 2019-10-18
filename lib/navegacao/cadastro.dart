import 'package:cardapio_show/helpers/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:email_validator/email_validator.dart';

var maskFormatter = new MaskTextInputFormatter(mask: '(##)#####-####', filter: { "#": RegExp(r'[0-9]') });
var maskFormatterCpf = new MaskTextInputFormatter(mask: '###.###.###-##', filter: { "#": RegExp(r'[0-9]') });

// EDIT TEXT
GlobalKey<FormState> _formKey = GlobalKey<FormState>(debugLabel: "_formKey");

TextEditingController nomeController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController cpfController = TextEditingController();
TextEditingController senhaController = TextEditingController();

class Cadastro extends StatelessWidget {
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
                
                Form(
                  key: _formKey,
                  child:Column(
                    children: <Widget>[
                      Container(
                    height: 60,
                    width: 300,
                    margin: EdgeInsets.only(bottom: 10,),
                    child: TextFormField(
                      controller: nomeController,
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
                      validator: (value){
                        if(value.isEmpty){
                          return "Insira seu nome !!!";
                        }
                      },
                    )
                ),
                Container(
                  height: 60,
                  width: 300,                  
                   margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                    decoration:
                    InputDecoration(                   
                        fillColor: Colors.black,
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        prefixIcon: Icon(Icons.email,color: Colors.black,),
                        hintText: "E-mail",     
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent, width: 32.0),
                            borderRadius: BorderRadius.circular(25.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 32.0),
                            borderRadius: BorderRadius.circular(25.0))
                    ),
                    validator: (val) => !EmailValidator.validate(val, true)
                    ? 'Not a valid email.'
                    : null,
                  ),  
                ),
                Container(
                  height: 60,
                  width: 300,
                   margin: EdgeInsets.only(bottom: 3),
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,  
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
                    validator: (value){
                        if(value.isEmpty){
                          return "Insira seu telefone !!!";
                        }else if(value == "(11)11111-1111"){
                          return "telefone errado";
                        }else if(value == "(22)22222-2222"){
                          return "telefone errado";
                        }else if(value == "(33)33333-3333"){
                          return "telefone errado";
                        }else if(value == "(44)44444-4444"){
                          return "telefone errado";
                        }else if(value == "(55)55555-5555"){
                          return "telefone errado";
                        }else if(value == "(66)66666-6666"){
                          return "telefone errado";
                        }else if(value == "(77)77777-7777"){
                          return "telefone errado";
                        }else if(value == "(88)88888-8888"){
                          return "telefone errado";
                        }else if(value == "(99)99999-9999"){
                          return "telefone errado";
                        }else if(value == "(00)00000-0000"){
                          return "telefone errado";
                        }
                      },
                  ),                
                ),  
                
                Container(
                  height: 60,
                  width: 300,
                  
                   margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    
                    obscureText: true,
                    controller: senhaController,
                    keyboardType: TextInputType.text,
                    maxLength: 64,
                    
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                    decoration:
                    InputDecoration(                      
                        fillColor: Colors.black,
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        prefixIcon: Icon(Icons.lock,color: Colors.black,),
                        hintText: "Senha",                        
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent, width: 32.0),
                            borderRadius: BorderRadius.circular(25.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 32.0),
                            borderRadius: BorderRadius.circular(25.0))
                    ),
                    validator: (value){
                        if(value.isEmpty){
                          return "Digite uma senha !!!";
                        }else if(value.length < 6){
                          return "Ops , senha menor que 6 digitos";
                        }
                      },
                  ),                
                ), 
                Container(
                  height: 50,
                  width: 200,
                  margin: EdgeInsets.only(bottom: 30),
                  child: RaisedButton(
                    color: Color.fromRGBO(252, 76, 2, 1),
                    onPressed: ()async{
                      if(_formKey.currentState.validate()){
                        if(_formKey.currentState.validate()){
                          User user = User(
                             nome: nomeController.text,
                              email: emailController.text,
                              phone : phoneController.text,
                              cpf: cpfController.text,
                              senha: senhaController.text
                              
                              );
                              
                              user.post(context);
                              clearField();
                        }
                      }
                      
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "CADASTRAR",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                ), 
                    ],
                  ) ,
                )  ,   
                
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

clearField(){
  nomeController.clear();
  emailController.clear();
  phoneController.clear();
  senhaController.clear();
}