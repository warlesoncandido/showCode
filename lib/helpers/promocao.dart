class Promocao {
  String codregistro;
  String idpromocao;
  String dtvalini;
  String dtvalfim;
  String quantidade;
  String regra;
  String imagem;
  String nomepromocao;
  String nomecasa;
  String dtusoini;
  String dtusofim;

  Promocao({
      this.codregistro,
      this.idpromocao,
      this.dtvalini,
      this.dtvalfim,
      this.quantidade,
      this.regra,
      this.imagem,
      this.nomepromocao,
      this.nomecasa,
      this.dtusoini,
      this.dtusofim});

  Promocao.fromJson(Map<String, dynamic> json) {
    codregistro = json['codregistro'];
    idpromocao = json['idpromocao'];
    dtvalini = json['dtvalini'];
    dtvalfim = json['dtvalfim'];
    quantidade = json['quantidade'];
    regra = json['regra'];
    imagem = json['imagem'];
    nomepromocao = json['nomepromocao'];
    nomecasa = json['nomecasa'];
    dtusoini = json['dtusoini'];
    dtusofim = json['dtusofim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codregistro'] = this.codregistro;
    data['idpromocao'] = this.idpromocao;
    data['dtvalini'] = this.dtvalini;
    data['dtvalfim'] = this.dtvalfim;
    data['quantidade'] = this.quantidade;
    data['regra'] = this.regra;
    data['imagem'] = this.imagem;
    data['nomepromocao'] = this.nomepromocao;
    data['nomecasa'] = this.nomecasa;
    data['dtusoini'] = this.dtusoini;
    data['dtusofim'] = this.dtusofim;
    return data;
  }
}