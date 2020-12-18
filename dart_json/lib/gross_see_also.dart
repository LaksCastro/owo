import 'dart:convert';

class GlossSeeAlso {
  final String titulo;
  final int ano;

  GlossSeeAlso({
    this.titulo,
    this.ano,
  });

  GlossSeeAlso.fromJson(Map<String, dynamic> json)
      : titulo = json['titulo'],
        ano = json['ano'];
}
// {
//   "titulo": "qualquer coisa",
//   "ano": 2016
// }
