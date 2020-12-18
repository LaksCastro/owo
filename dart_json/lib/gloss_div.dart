import './gloss_list.dart';

class GlossDiv {
  final String title;
  final List<GlossList> grossList;

  GlossDiv({
    this.title,
    this.grossList,
  });

  GlossDiv.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        grossList = List.from(json['GlossList'])
            .map((elemento) => GlossList.papaiNoel(elemento))
            .toList();
}
