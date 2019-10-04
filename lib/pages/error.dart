import 'package:flutter/material.dart';

class Erro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        
        child: Image.asset('images/sem-conexao.png',
                width: 200,
                height: 200,),
      ),
    );
  }
}