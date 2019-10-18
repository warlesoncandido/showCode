class Pratos {
  String preco;
  String relacaoPrato;
  String nomePrato;
  String descricaoPrato;
  String imagemPrato;
  String idProduto;
  String idGrupo;

  Pratos(
      {this.preco,
      this.relacaoPrato,
      this.nomePrato,
      this.descricaoPrato,
      this.imagemPrato,
      this.idProduto,
      this.idGrupo});

  Pratos.fromJson(Map<String, dynamic> json) {
    preco = json['preco'];
    relacaoPrato = json['relacao_prato'];
    nomePrato = json['nome_prato'];
    descricaoPrato = json['descricao_prato'];
    imagemPrato = json['imagem_prato'];
    idProduto = json['id_produto'];
    idGrupo = json['id_grupo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['preco'] = this.preco;
    data['relacao_prato'] = this.relacaoPrato;
    data['nome_prato'] = this.nomePrato;
    data['descricao_prato'] = this.descricaoPrato;
    data['imagem_prato'] = this.imagemPrato;
    data['id_produto'] = this.idProduto;
    data['id_grupo'] = this.idGrupo;
    return data;
  }
}