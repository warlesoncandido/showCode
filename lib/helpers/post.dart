class Post {
  String razaosocial;
  String numeroendereco;
  String quantidadeDispositivos;
  String site;
  String pais;
  String estacionamento;
  String complemento;
  String manobrista;
  String playground;
  String telefone;
  String latitude;
  String email;
  String descricao;
  String cnpj;
  String tipoEmpresa;
  String bairro;
  String temcardapio;
  String cep;
  String logoempresa;
  String facebook;
  String instagram;
  String estado;
  String codregistro;
  String url;
  String cidade;
  String imagemMenu;
  String longitude;
  String quantidadeAcessos;
  String endereco;

  Post(
      {this.razaosocial,
      this.numeroendereco,
      this.quantidadeDispositivos,
      this.site,
      this.pais,
      this.estacionamento,
      this.complemento,
      this.manobrista,
      this.playground,
      this.telefone,
      this.latitude,
      this.email,
      this.descricao,
      this.cnpj,
      this.tipoEmpresa,
      this.bairro,
      this.temcardapio,
      this.cep,
      this.logoempresa,
      this.facebook,
      this.instagram,
      this.estado,
      this.codregistro,
      this.url,
      this.cidade,
      this.imagemMenu,
      this.longitude,
      this.quantidadeAcessos,
      this.endereco});

  Post.fromJson(Map<String, dynamic> json) {
    razaosocial = json['razaosocial'];
    numeroendereco = json['numeroendereco'];
    quantidadeDispositivos = json['quantidade_dispositivos'];
    site = json['site'];
    pais = json['pais'];
    estacionamento = json['estacionamento'];
    complemento = json['complemento'];
    manobrista = json['manobrista'];
    playground = json['playground'];
    telefone = json['telefone'];
    latitude = json['latitude'];
    email = json['email'];
    descricao = json['descricao'];
    cnpj = json['cnpj'];
    tipoEmpresa = json['tipo_empresa'];
    bairro = json['bairro'];
    temcardapio = json['temcardapio'];
    cep = json['cep'];
    logoempresa = json['logoempresa'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    estado = json['estado'];
    codregistro = json['codregistro'];
    url = json['url'];
    cidade = json['cidade'];
    imagemMenu = json['imagem_menu'];
    longitude = json['longitude'];
    quantidadeAcessos = json['quantidade_acessos'];
    endereco = json['endereco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['razaosocial'] = this.razaosocial;
    data['numeroendereco'] = this.numeroendereco;
    data['quantidade_dispositivos'] = this.quantidadeDispositivos;
    data['site'] = this.site;
    data['pais'] = this.pais;
    data['estacionamento'] = this.estacionamento;
    data['complemento'] = this.complemento;
    data['manobrista'] = this.manobrista;
    data['playground'] = this.playground;
    data['telefone'] = this.telefone;
    data['latitude'] = this.latitude;
    data['email'] = this.email;
    data['descricao'] = this.descricao;
    data['cnpj'] = this.cnpj;
    data['tipo_empresa'] = this.tipoEmpresa;
    data['bairro'] = this.bairro;
    data['temcardapio'] = this.temcardapio;
    data['cep'] = this.cep;
    data['logoempresa'] = this.logoempresa;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['estado'] = this.estado;
    data['codregistro'] = this.codregistro;
    data['url'] = this.url;
    data['cidade'] = this.cidade;
    data['imagem_menu'] = this.imagemMenu;
    data['longitude'] = this.longitude;
    data['quantidade_acessos'] = this.quantidadeAcessos;
    data['endereco'] = this.endereco;
    return data;
  }

  
}