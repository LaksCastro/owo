import 'package:anime_dart/app/core/browsing/external/data_sources/anime_tv_browsing_data_source.dart';
import 'package:anime_dart/app/core/browsing/infra/repositories/browsing_repository.dart';
import 'package:anime_dart/app/core/details/external/data_source/anime_tv_details_data_source.dart';
import 'package:anime_dart/app/core/details/infra/repositories/details_repository.dart';
import 'package:anime_dart/app/core/favorites/external/data_sources/shared_prefs_data_source.dart';
import 'package:anime_dart/app/core/favorites/infra/repositories/favorites_repository.dart';
import 'package:anime_dart/app/core/search/external/data_sources/anime_tv_search_data_source.dart';
import 'package:anime_dart/app/core/search/infra/repositories/search_repository.dart';
import 'package:anime_dart/app/core/watched/external/data_sources/shared_prefs_data_source.dart';
import 'package:anime_dart/app/core/watched/infra/repositories/watched_repository.dart';
import 'package:anime_dart/app/modules/home/screens/anime_details/anime_details_screen.dart';
import 'package:anime_dart/app/modules/home/screens/home/home_screen.dart';
import 'package:anime_dart/app/modules/home/screens/player/player_screen.dart';
import 'package:anime_dart/app/modules/home/screens/watch_episode/watch_episode_screen.dart';
import 'package:anime_dart/app/modules/home/store/anime_details_store.dart';
import 'package:anime_dart/app/modules/home/store/home_store.dart';
import 'package:anime_dart/app/modules/home/store/watch_episode_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SharedPrefsFavoritesDataSource()),
        Bind((i) => FavoritesRepositoryImplementation(
            dataSource: i.get<SharedPrefsFavoritesDataSource>())),
        Bind((i) => SharedPrefsWatchedDataSource()),
        Bind((i) => WatchedRepositoryImplementation(
            dataSource: i.get<SharedPrefsWatchedDataSource>())),
        Bind((i) => AnimeTvSearchDataSource(
            favorites: i.get<FavoritesRepositoryImplementation>())),
        Bind((i) => AnimeTvBrowsingDataSource(
            favorites: i.get<FavoritesRepositoryImplementation>(),
            watched: i.get<WatchedRepositoryImplementation>())),
        Bind((i) => BrowsingRepositoryImplementation(
            dataSource: i.get<AnimeTvBrowsingDataSource>())),
        Bind((i) => AnimeTvDetailsDataSource(
            favorites: i.get<FavoritesRepositoryImplementation>(),
            watched: i.get<WatchedRepositoryImplementation>())),
        Bind((i) => DetailsRepositoryImplementation(
            dataSource: i.get<AnimeTvDetailsDataSource>())),
        Bind((i) => SearchRepositoryImplementation(
            dataSource: i.get<AnimeTvSearchDataSource>())),
        Bind((i) => HomeStore(
            repository: i.get<BrowsingRepositoryImplementation>(),
            favoritesRepository: i.get<FavoritesRepositoryImplementation>(),
            watchedRepository: i.get<WatchedRepositoryImplementation>(),
            detailsRepository: i.get<DetailsRepositoryImplementation>())),
      ];

  @override
  List<Router> get routers => [
        Router("/", child: (_, __) => HomeScreen()),
        Router("/watch-episode", child: (_, i) => WatchEpisodeScreen()),
        Router("/anime-details", child: (_, i) => AnimeDetailsScreen()),
        Router("/play-episode", child: (_, i) => PlayerScreen())
      ];
}
