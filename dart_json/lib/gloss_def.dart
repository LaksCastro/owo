import 'gross_see_also.dart';

class GlossDef {
  final String para;
  final List<GlossSeeAlso> glossSeeAlsos;

  GlossDef({
    this.para,
    this.glossSeeAlsos,
  });

  GlossDef.fromJson(Map<String, dynamic> json)
      : para = json['para'],
        glossSeeAlsos = List.from(json['GlossSeeAlso'])
            .map((elemento) => GlossSeeAlso.fromJson(elemento))
            .toList();
}
