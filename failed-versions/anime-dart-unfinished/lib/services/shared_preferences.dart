import 'package:anime_dart/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesInstance {
  static final _instance = getIt<SharedPreferences>();
  static final String _episodePrefix = "episode__";
  static final String _animePrefix = "anime__";

  static String _getEpisodePrefix(String episodeId) {
    return "${SharedPreferencesInstance._episodePrefix}$episodeId";
  }

  static String _getAnimePrefix(String episodeId) {
    return "${SharedPreferencesInstance._animePrefix}$episodeId";
  }

  void setEpisodeProgress(String episodeId, double percentage) {
    final key = SharedPreferencesInstance._getEpisodePrefix(episodeId);

    _instance.setDouble(key, percentage);
  }

  double getEpisodeProgress(String episodeId) {
    final key = SharedPreferencesInstance._getEpisodePrefix(episodeId);

    return _instance.getDouble(key) ?? 0;
  }

  void addFavoriteAnime(String animeId) {
    final key = SharedPreferencesInstance._getAnimePrefix(animeId);

    _instance.setBool(key, true);
  }

  void removeFavoriteAnime(String animeId) {
    final key = SharedPreferencesInstance._getAnimePrefix(animeId);

    _instance.setBool(key, true);
  }

  bool isFavoriteAnime(String animeId) {
    final key = SharedPreferencesInstance._getAnimePrefix(animeId);

    return _instance.getBool(key) ?? false;
  }
}
