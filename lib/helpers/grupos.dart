class Grupos {
  String idGrupo;
  String nomeGrupo;
  

  Grupos(this.idGrupo, this.nomeGrupo);

  Grupos.fromJson(Map<String, dynamic> json) {
    idGrupo = json['id_grupo'];
    nomeGrupo = json['nome_grupo'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_grupo'] = this.idGrupo;
    data['nome_grupo'] = this.nomeGrupo;
    
    return data;
  }
}