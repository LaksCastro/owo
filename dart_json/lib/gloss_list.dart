import 'gloss_entry.dart';

class GlossList {
  final GlossEntry glossEntry;

  GlossList({
    this.glossEntry,
  });

  GlossList.papaiNoel(Map<String, dynamic> json)
      : glossEntry = GlossEntry.fromJson(json['GlossEntry']);
}
