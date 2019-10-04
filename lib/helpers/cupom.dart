import 'package:http/http.dart' as http;
class Cupom {
  String codregistro;
  String cupom;
  String idCliente;
  String idPromocao;

  Cupom({this.codregistro, this.cupom, this.idCliente, this.idPromocao});

  Cupom.fromJson(Map<String, dynamic> json) {
    codregistro = json['codregistro'];
    cupom = json['cupom'];
    idCliente = json['id_cliente'];
    idPromocao = json['id_promocao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codregistro'] = this.codregistro;
    data['cupom'] = this.cupom;
    data['id_cliente'] = this.idCliente;
    data['id_promocao'] = this.idPromocao;
    return data;
  }

  postarCupom()async{
        Map<String, String> headers = {
         "Accept": "application/json",
         "Content-Type": "application/x-www-form-urlencoded",
         "tipo" : "cliente"
         
        };

    var url = "http://erp.addmob.com.br/cadastro_cupom?cupom";
    Map<String, dynamic> body = {
      
       'cupom': '[{"codregistro" : "${this.codregistro}" , "cupom":"${this.cupom}" , "id_cliente" : "${this.idCliente}" , "id_promocao" : "${this.idPromocao}"}]',
       'idpromo': '2'
       };
    
    http.Response response = await http.post(
      url,
      headers: headers ,
      body:body,
      
    );
    print("resposta : ${response.statusCode}");
    print("resposta : ${response.body}");
  }

}