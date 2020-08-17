import 'package:anime_dart/models/resource.dart';
import 'package:anime_dart/models/anime_details_args.dart';
import 'package:anime_dart/services/anime_tv_api.dart';

import 'package:diacritic/diacritic.dart';
import 'package:anime_dart/screens/barrel.dart';

class SearchProvider {
  static final _animeTvApi = AnimeTvApi();

  String getKeyword(String text) {
    return removeDiacritics(text.replaceAll(" ", "_"));
  }

  Future<List<Resource>> searchByKeyword(String keyword) async {
    try {
      List<Resource> resources = [];

      final resourcesData =
          await SearchProvider._animeTvApi.searchByKeyword(keyword);

      for (final resourceData in resourcesData) {
        resources.add(
          Resource(
              imageUrl: resourceData.imageUrl,
              label: resourceData.label,
              id: resourceData.id,
              link: (_) => AnimeDetails(
                  args: AnimeDetailsArgs(
                      animeId: resourceData.id, title: resourceData.label))),
        );
      }

      return resources;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
