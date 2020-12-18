import 'gloss_div.dart';

class Glossary {
  final String title;
  final GlossDiv glossDiv;

  Glossary({
    this.title,
    this.glossDiv,
  });

  Glossary.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        glossDiv = GlossDiv.fromJson(json['GlossDiv']);
}
