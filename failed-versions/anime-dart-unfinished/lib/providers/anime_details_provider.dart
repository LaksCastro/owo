import "package:anime_dart/models/barrel.dart";
import 'package:anime_dart/screens/watch_episode.dart';
import 'package:anime_dart/services/anime_tv_api.dart';
import 'package:anime_dart/services/shared_preferences.dart';

class AnimeDetailsProvider {
  static final _animeTvApi = AnimeTvApi();
  static final _sharedPreferencesInstance = SharedPreferencesInstance();

  Future<AnimeDetails> detailsOf(String animeId) async {
    try {
      final animeDetailsData =
          await AnimeDetailsProvider._animeTvApi.detailsOf(animeId);

      AnimeDetails animeDetails;

      animeDetails = AnimeDetails(
        description: animeDetailsData.description,
        title: animeDetailsData.title,
        genres: animeDetailsData.genres.replaceAll(" ", "").split(","),
        id: animeDetailsData.id,
        imageUrl: animeDetailsData.imageUrl,
        year: animeDetailsData.year,
      );

      return animeDetails;
    } catch (e) {
      return null;
    }
  }

  Future<List<EpisodeInfo>> episodesOf(AnimeDetails animeDetails) async {
    try {
      final animeEpisodesData =
          (await AnimeDetailsProvider._animeTvApi.episodesOf(animeDetails.id))
              .reversed;

      List<EpisodeInfo> animeEpisodes = [];

      for (final animeEpisodeData in animeEpisodesData) {
        double progress = progressAtEpisode(animeEpisodeData.id);

        animeEpisodes.add(EpisodeInfo(
            progress: progress,
            animeId: animeEpisodeData.animeId,
            id: animeEpisodeData.id,
            label: "${animeEpisodeData.label} - ${progress.toInt()}%",
            link: (_) => WatchEpisode(
                  args: WatchEpisodeArgs(
                      animeId: animeEpisodeData.animeId,
                      episodeId: animeEpisodeData.id,
                      label: animeEpisodeData.label,
                      imageUrl: animeDetails.imageUrl),
                )));
      }

      return animeEpisodes;
    } catch (e) {
      return null;
    }
  }

  double progressAtEpisode(String episodeId) {
    return AnimeDetailsProvider._sharedPreferencesInstance
        .getEpisodeProgress(episodeId);
  }
}
