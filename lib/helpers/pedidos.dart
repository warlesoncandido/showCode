import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



GlobalKey chave = GlobalKey();

class Pedidos {
  int status;
  String codigo;
  String codPedidoVendasc;
  String idMesa;
  String idVendedor;
  String quantidadeProduto;
  String idProduto;
  String precoProduto;
  String quantidadeOpcional;
  String idOpcional;
  String precoOpcional;
  String idCelular;
  String idCliente;
  String pedido;
  int statusCode;

  Pedidos(
      {this.codPedidoVendasc,
      this.idMesa,
      this.idVendedor,
      this.quantidadeProduto,
      this.idProduto,
      this.precoProduto,
      this.quantidadeOpcional,
      this.idOpcional,
      this.precoOpcional,
      this.idCelular,
      this.idCliente,
      this.pedido,
      this.statusCode});

  Pedidos.fromJson(Map<String, dynamic> json) {
    codPedidoVendasc = json['cod_pedido_vendasc'];
    idMesa = json['id_mesa'];
    idVendedor = json['id_vendedor'];
    quantidadeProduto = json['quantidade_produto'];
    idProduto = json['id_produto'];
    precoProduto = json['preco_produto'];
    quantidadeOpcional = json['quantidade_opcional'];
    idOpcional = json['id_opcional'];
    precoOpcional = json['preco_opcional'];
    idCelular = json['id_celular'];
    idCliente = json['id_cliente'];
    pedido = json['pedido'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cod_pedido_vendasc'] = this.codPedidoVendasc;
    data['id_mesa'] = this.idMesa;
    data['id_vendedor'] = this.idVendedor;
    data['quantidade_produto'] = this.quantidadeProduto;
    data['id_produto'] = this.idProduto;
    data['preco_produto'] = this.precoProduto;
    data['quantidade_opcional'] = this.quantidadeOpcional;
    data['id_opcional'] = this.idOpcional;
    data['preco_opcional'] = this.precoOpcional;
    data['id_celular'] = this.idCelular;
    data['id_cliente'] = this.idCliente;
    data['pedido'] = this.pedido;
    data['statusCode'] = this.statusCode;
    return data;
  }

  
  
  fazendoPedido(cod , context)async{

    try{
      Map<String, String> headers = {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        "codregistro" : "13du5t1p6s5pjz",
        "cardapio_show" :""
                                                                
      };

      var url = "http://erp.addmob.com.br/novo_pedido_mesa?codregistro=$cod&cardapio_show";
      Map<String, dynamic> body = {
        "cod_pedido_vendasc" : this.codPedidoVendasc,
        "id_mesa" : this.idMesa,
        "id_vendedor" : this.idVendedor,
        "quantidade_produto" : this.quantidadeProduto,
        "id_produto" : this.idProduto,
        "preco_produto" : this.precoProduto,
        "quantidade_opcional" : this.quantidadeOpcional,
        "id_opcional" : this.idOpcional,
        "preco_opcional" : this.precoOpcional,
        "id_celular" : this.idCelular,
        "id_cliente" : this.idCliente,


      };                                                            
      http.Response response = await http.post(
        url,
        headers: headers ,
        body:body,
                                                                    
      );
      Map dados = json.decode(response.body);
      var r  = dados['resposta'];                                                         
       print("resposta : ${response.statusCode}");
       print(r['cod']);
      codigo = r['cod'].toString();
      status = response.statusCode;        
    } catch (e){
      if(e is SocketException) Navigator.pop(context);
    }
             
  }
  setItem()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("cod",codigo);
      prefs.setString("status", status.toString());
      

  }
  
}
                                                             