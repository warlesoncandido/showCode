import 'dart:async';
import 'package:cardapio_show/pages/promo.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  Future<Timer> loadData() async {
  return new Timer(Duration(seconds: 3), (){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Promo()));
  });
}

  @override
  void initState() {
    // TODO: implement initState
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




