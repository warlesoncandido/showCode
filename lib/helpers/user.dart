import 'package:http/http.dart' as http;
class User{
  String _nome;
  String _email;
  String _phone;

  User(this._nome,this._email,this._phone);

  post()async{
        Map<String, String> headers = {
         "Accept": "application/json",
         "Content-Type": "application/x-www-form-urlencoded",
         "tipo" : "cliente"
         
        };

    var url = "http://erp.addmob.com.br/post_cliente";
    Map<String, dynamic> body = {
      'tipo': 'cliente',
       'json': '{"cliente": [{"nome_cliente": "${this._nome}", "email": "${this._email}", "telefone": "${this._phone}"}]}'};
    
    http.Response response = await http.post(
      url,
      headers: headers ,
      body:body,
      
    );
    print("resposta : ${response.statusCode}");
    print("resposta : ${response.body}");
  }


}