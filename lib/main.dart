import 'package:cardapio_show/navegacao/inicio.dart';
import 'package:cardapio_show/navegacao/login.dart';
import 'package:cardapio_show/navegacao/recuperar.dart';
import 'package:cardapio_show/splashScreen.dart';
import 'package:flutter/material.dart';
import 'navegacao/error.dart';



void main(){
  runApp(MaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
    routes: {
        "erro": (BuildContext context) => Erro(),
        "inicio" : (BuildContext context) => Promo(),
        "login" : (BuildContext context) =>Loginv(),
        "recuperar" : (BuildContext context) =>Recuperar()
        
      },
    
  ));
}