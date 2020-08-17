import 'package:anime_dart/models/barrel.dart';
import 'package:anime_dart/models/watch_episode_args.dart';
import 'package:anime_dart/screens/barrel.dart';

import 'package:anime_dart/services/anime_tv_api.dart';

class LatestProvider {
  static final _animeTvApi = AnimeTvApi();

  Future<List<Resource>> getLatest() async {
    try {
      List<Resource> resources = [];

      final resourcesData = await LatestProvider._animeTvApi.getLatest();

      for (final resourceData in resourcesData) {
        resources.add(
          Resource(
              imageUrl: resourceData.imageUrl,
              label: resourceData.label,
              id: resourceData.id,
              linkId: resourceData.linkId,
              link: (_) => WatchEpisode(
                  args: WatchEpisodeArgs(
                      animeId: resourceData.linkId,
                      episodeId: resourceData.id,
                      imageUrl: resourceData.imageUrl,
                      label: resourceData.label))),
        );
      }

      return resources;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
