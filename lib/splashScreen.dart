import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<Timer> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  return new Timer(Duration(seconds: 3), (){

    if(prefs.getString("idUser")== "" || prefs.getString("idUser")== null ){
      Navigator.pushReplacementNamed(context, "login");
    }else{
      Navigator.pushReplacementNamed(context, "inicio");
    }
    
  });
}

  @override
  void initState() {
    
    super.initState();

    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              child: Image.asset("images/icon-cardapio-show-transparente.png"),
              ),
            Container(
              height: 100,
              width: 100,
              child: JumpingDotsProgressIndicator(
                numberOfDots: 3,
                dotSpacing: 3,
                color: Colors.blue,
              fontSize: 90,
            ),
            )
          ],
        )
      ),
    );
  }
}




