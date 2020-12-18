import 'gloss_def.dart';

class GlossEntry {
  final String id;
  final GlossDef glossDef;

  GlossEntry({
    this.id,
    this.glossDef,
  });

  GlossEntry.fromJson(Map<String, dynamic> json)
      : id = json['ID'],
        glossDef = GlossDef.fromJson(json['GlossDef']);
}
