import 'dart:core';
import 'dart:convert';

import 'glossary.dart';

final respostaDaApi = '''
{
  "glossary": {
    "title": "example glossary",
    "GlossDiv": {
      "title": "S",
      "GlossList": [
        {
          "GlossEntry": {
            "ID": "SGML",
            "GlossDef": {
              "para": "A meta-markup language, used to create markup languages such as DocBook.",
              "GlossSeeAlso": [
                {
                  "titulo": "qualquer coisa",
                  "ano": 2016
                },
                {
                  "titulo": "qualquer coisa 2",
                  "ano": 2020
                }
              ]
            }
          }
        }
      ]
    }
  }
}
''';

void main(List<String> args) {
  final result = http.get...

  
  final result = json.decode(respostaDaApi);

  final glossaryCru = result['glossary'];

  final Glossary nossoQueridoGlossario = Glossary.fromJson(glossaryCru);

  print(
    nossoQueridoGlossario
        .glossDiv.grossList[0].glossEntry.glossDef.glossSeeAlsos[0].ano,
  );
}
