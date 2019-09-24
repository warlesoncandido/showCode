class Pratos {
  String preco;
  String relacaoPrato;
  String nomePrato;
  String descricaoPrato;
  String imagemPrato;
  String id_produto;
  String id_grupo;

  Pratos(
      {this.preco,
      this.relacaoPrato,
      this.nomePrato,
      this.descricaoPrato,
      this.imagemPrato,
      this.id_produto,
      this.id_grupo});

  Pratos.fromJson(Map<String, dynamic> json) {
    preco = json['preco'];
    relacaoPrato = json['relacao_prato'];
    nomePrato = json['nome_prato'];
    descricaoPrato = json['descricao_prato'];
    imagemPrato = json['imagem_prato'];
    id_produto = json['id_produto'];
    id_grupo = json['id_grupo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['preco'] = this.preco;
    data['relacao_prato'] = this.relacaoPrato;
    data['nome_prato'] = this.nomePrato;
    data['descricao_prato'] = this.descricaoPrato;
    data['imagem_prato'] = this.imagemPrato;
    data['id_produto'] = this.id_produto;
    data['id_grupo'] = this.id_grupo;
    return data;
  }
}