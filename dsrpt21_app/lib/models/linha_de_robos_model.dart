import 'dart:convert';

class LinhaDeRobosModel {
  int id;
  String nome;
  int numero;
  String esquema;
  String profissao;
  List<String> caracteristicas = [];
  double statusProducao;

  LinhaDeRobosModel({
    this.id,
    this.nome,
    this.numero,
    this.esquema,
    this.profissao,
    this.caracteristicas,
    this.statusProducao,
  });

  factory LinhaDeRobosModel.fromJson(String str) =>
      LinhaDeRobosModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LinhaDeRobosModel.fromMap(Map<String, dynamic> json) =>
      LinhaDeRobosModel(
        id: (json["id"] is int) ? json["id"] : int.parse(json["id"]),
        nome: json["nome"],
        numero: json["numero"],
        esquema: json["esquema"],
        profissao: json["profissao"],
        caracteristicas: json["caracteristicas"],
        statusProducao: json["statusProducao"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "numero": numero,
        "esquema": esquema,
        "profissao": profissao,
        "caracteristicas": caracteristicas,
        "statusProducao": statusProducao,
      };
}
