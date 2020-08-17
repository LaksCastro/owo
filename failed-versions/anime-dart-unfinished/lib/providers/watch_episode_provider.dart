import 'package:anime_dart/models/barrel.dart';
import 'package:anime_dart/services/anime_tv_api.dart';

class WatchEpisodeProvider {
  static final _animeTvApi = AnimeTvApi();

  Future<VideoResource> getVideo(String episodeId) async {
    try {
      VideoResource videoResource;

      final videoData =
          await WatchEpisodeProvider._animeTvApi.getVideo(episodeId);

      videoResource = VideoResource(
          urlHd: videoData.urlHd,
          url: videoData.url,
          episodeId: videoData.episodeId);

      return videoResource;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
