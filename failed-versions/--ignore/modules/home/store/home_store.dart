import 'package:anime_dart/app/constants/utils.dart';
import 'package:anime_dart/app/core/browsing/domain/entities/episode.dart';
import 'package:anime_dart/app/core/browsing/domain/repositories/browsing_repository.dart';
import 'package:anime_dart/app/core/details/domain/entities/anime_details.dart';
import 'package:anime_dart/app/core/details/domain/entities/episode_details.dart';
import 'package:anime_dart/app/core/details/domain/repository/details_repository.dart';
import 'package:anime_dart/app/core/favorites/domain/repositories/favorite_repository.dart';
import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:anime_dart/app/core/watched/domain/repository/watched_repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:video_player/video_player.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

@Injectable()
abstract class _HomeStoreBase with Store {
  final BrowsingRepository repository;
  final DetailsRepository detailsRepository;
  final FavoritesRepository favoritesRepository;
  final WatchedRepository watchedRepository;

  _HomeStoreBase(
      {this.repository,
      this.detailsRepository,
      this.favoritesRepository,
      this.watchedRepository});

  // ==========================
  //   LATEST SCREEN STATE
  // ==========================
  @observable
  ObservableList<Episode> latests;

  @observable
  bool loadingLatests = true;

  @observable
  String latestsError;

  @action
  Future<void> loadLatests() async {
    loadingLatests = true;

    final result = await repository.getLatestEpisodes();

    runInAction(() {
      result.fold((l) {
        latestsError = "Não foi possível carregar os últimos episódios";
        latests = null;
      }, (r) {
        latests = ObservableList<Episode>.of(r);
        latestsError = null;
      });

      loadingLatests = false;
    });
  }

  // ==========================
  //   TRENDING SCREEN STATE
  // ==========================
  @observable
  ObservableList<Anime> trending;

  @observable
  bool loadingTrending = true;

  @observable
  String trendingError;

  @action
  Future<void> loadTrending() async {
    loadingTrending = true;

    final result = await repository.getTrendingAnimes();

    runInAction(() {
      result.fold((l) {
        trendingError = "Não foi possível carregar os animes mais populares";
        trending = null;
      }, (r) {
        trending = ObservableList<Anime>.of(r);
        trendingError = null;
      });

      loadingTrending = false;
    });
  }

  // ==========================
  //   RANDOM SCREEN STATE
  // ==========================
  @observable
  ObservableList<Anime> random;

  @observable
  bool loadingRandom = true;

  @observable
  bool loadingMoreRandom = false;

  @observable
  String randomError;

  @observable
  String randomLoadingMoreError;

  @action
  Future<void> loadRandom() async {
    loadingRandom = true;

    final result = await repository.getRandomAnimes();

    runInAction(() {
      result.fold((l) {
        randomError = "Não foi possível carregar os animes aleatórios";
        random = null;
      }, (r) {
        random = ObservableList<Anime>.of(r);
        randomError = null;
      });

      loadingRandom = false;
    });
  }

  @action
  Future<void> loadMoreRandom() async {
    loadingMoreRandom = true;

    final result = await repository.getRandomAnimes();

    runInAction(() {
      result.fold((l) {
        randomLoadingMoreError = "Não foi possível carregar mais animes";
      }, (r) {
        random.addAll(ObservableList<Anime>.of(r));
        randomLoadingMoreError = null;
      });

      loadingMoreRandom = false;
    });
  }

  // ==========================
  //   FAVORITES SCREEN STATE
  // ==========================
  @observable
  ObservableList<Anime> favorites;

  @observable
  bool loadingFavorites = true;

  @observable
  String favoritesError;

  @computed
  bool get emptyFavoriteList => favorites != null && favorites.length == 0;

  @action
  Future<void> loadFavorites() async {
    loadingFavorites = true;

    final result = await repository.getFavoriteAnimes();

    runInAction(() {
      result.fold((l) {
        favoritesError = "Não foi possível carregar os seus animes favoritos";
        favorites = null;
      }, (r) {
        favorites = ObservableList<Anime>.of(r);
        favoritesError = null;
      });

      loadingFavorites = false;
    });
  }

  // ==========================
  //   ANIME DETAILS SCREEN STATE
  // ==========================
  @observable
  AnimeDetails animeDetails;

  @observable
  ObservableList<EpisodeDetails> episodesOfAnimeDetails;

  @observable
  String error;

  @observable
  String internalSearch = "";

  @observable
  var filteredEpisodes = ObservableList<EpisodeDetails>.of([]);

  @observable
  bool showSearch = false;

  @observable
  String episodeIdPlaying;

  @observable
  String episodeUrlPlaying;

  @observable
  String animeId;

  @computed
  bool get searchMode => internalSearch != "";

  @computed
  bool get notFoundInternalSearch => searchMode && filteredEpisodes.length == 0;

  @computed
  bool get loading =>
      episodesOfAnimeDetails == null && animeDetails == null && error == null;

  @action
  void setAnimeDetailsId(String newAnimeId) {
    animeId = newAnimeId;
  }

  @action
  Future<void> loadAnimeDetails() async {
    if (animeDetails != null && animeDetails.id == animeId) {
      return;
    } else {
      animeDetails = null;
      episodesOfAnimeDetails = null;
      error = null;
      internalSearch = "";
      filteredEpisodes = ObservableList<EpisodeDetails>.of([]);
      showSearch = false;
      episodeIdPlaying = null;
      episodeUrlPlaying = null;
    }

    final result = await detailsRepository.getAnimeDetails(animeId);
    final resultEps = await detailsRepository.getEpisodesOf(animeId);

    runInAction(() {
      result.fold((l) {
        error = "Não foi possível carregar os dados do anime, tente novamente";
        animeDetails = null;
        episodesOfAnimeDetails = null;
      }, (rAnime) {
        resultEps.fold((l) {
          error =
              "Não foi possível carregar os dados do anime, tente novamente";
          animeDetails = null;
          episodesOfAnimeDetails = null;
        }, (rEpisodes) {
          animeDetails = rAnime;
          episodesOfAnimeDetails = ObservableList<EpisodeDetails>.of(rEpisodes);
          error = null;
        });
      });
    });
  }

  @action
  showSearchField(bool yesOrNo) {
    showSearch = yesOrNo;
  }

  @action
  setInternalSearch(String keyword) {
    internalSearch = keyword;
  }

  @action
  closeSearchMode() {
    showSearchField(false);
    setInternalSearch("");
    filteredEpisodes = ObservableList<EpisodeDetails>.of([]);
  }

  @action
  filterEpisodes() {
    int length = episodesOfAnimeDetails.length;

    filteredEpisodes = ObservableList<EpisodeDetails>.of([]);

    for (int i = length - 1; i >= 0; i--) {
      final episode = episodesOfAnimeDetails[i];

      if (episode.label.contains(internalSearch)) {
        filteredEpisodes.add(episode);
      }
    }
  }

  @action
  Future<void> toggleFavorite() async {
    bool newValue = !animeDetails.isFavorite;

    final result =
        await favoritesRepository.setFavorite(animeDetails.id, newValue);

    runInAction(() {
      result.fold((l) {
        return;
      }, (r) {
        animeDetails = AnimeDetails(
            isFavorite: newValue,
            genres: animeDetails.genres,
            id: animeDetails.id,
            imageHttpHeaders: animeDetails.imageHttpHeaders,
            imageUrl: animeDetails.imageUrl,
            synopsis: animeDetails.synopsis,
            title: animeDetails.title,
            year: animeDetails.year);
      });
    });
  }

  @action
  Future<void> setEpisodeStatsOnAnimeDetails(
      String episodeId, double newStats) async {
    if (episodesOfAnimeDetails == null) {
      return;
    }
    int index =
        episodesOfAnimeDetails.indexWhere((element) => element.id == episodeId);

    if (index < 0) {
      return;
    }

    final result =
        await watchedRepository.setEpisodeWatchedStats(episodeId, newStats);

    final resultEps = await watchedRepository.getEpisodeWatchedStats(episodeId);

    runInAction(() {
      result.fold((_) => {}, (_) {
        resultEps.fold((l) => {}, (r) {
          episodesOfAnimeDetails[index] = EpisodeDetails(
            animeId: episodesOfAnimeDetails[index].animeId,
            id: episodesOfAnimeDetails[index].id,
            imageHttpHeaders: episodesOfAnimeDetails[index].imageHttpHeaders,
            imageUrl: episodesOfAnimeDetails[index].imageUrl,
            stats: r,
            label: episodesOfAnimeDetails[index].label,
            url: episodesOfAnimeDetails[index].url,
            urlHd: episodesOfAnimeDetails[index].urlHd,
          );
        });
      });
    });
  }

  @action
  Future<void> setEpisodeStats(String episodeId, double newStats) async {
    await watchedRepository.setEpisodeWatchedStats(episodeId, newStats);
  }

  @action
  void setPlayerEpisode(String targetEpisodeId, String url) {
    if (targetEpisodeId == null || url == null) {
      throw Exception(
          "Invalid. the Episode ID and URL must be String non-null");
    }

    episodeIdPlaying = targetEpisodeId;
    episodeUrlPlaying = url;
  }

// ==================
  // WATCH EPISODES STORE
// ==================
  @observable
  EpisodeDetails episodeDetails;

  @observable
  bool loadingWatchEpisode = true;

  @observable
  bool loadingOtherEpisode = false;

  @observable
  String errorMsg;

  @observable
  String episodeId;

  @action
  setWatchEpisodeId(String newEpisodeId) {
    episodeId = newEpisodeId;
  }

  @action
  Future<void> loadEpisode() async {
    if (episodeDetails != null && episodeDetails.id == episodeId) {
      return;
    } else {
      episodeDetails = null;
      loadingWatchEpisode = true;
      loadingOtherEpisode = false;
      errorMsg = null;
    }

    final result = await detailsRepository.getEpisodeDetails(episodeId);

    runInAction(() {
      result.fold((l) {
        errorMsg =
            "Não foi possível carregar os detalhes desse episódio, tente novamente";
      }, (r) {
        errorMsg = null;
        episodeDetails = r;
      });

      loadingWatchEpisode = false;
    });
  }

  @action
  Future<void> loadNextEpisode() async {
    loadingOtherEpisode = true;

    final result =
        await detailsRepository.getNextEpisodeDetails(episodeDetails.id);

    runInAction(() {
      result.fold((l) {}, (r) {
        episodeDetails = r;
      });
      loadingOtherEpisode = false;
    });
  }

  @action
  Future<void> loadPrevEpisode() async {
    loadingOtherEpisode = true;

    final result =
        await detailsRepository.getPreviousEpisodeDetails(episodeDetails.id);

    runInAction(() {
      result.fold((l) {}, (r) {
        episodeDetails = r;
      });

      loadingOtherEpisode = false;
    });
  }

// ===================
  // PLAYER STATE
// ===================
  @observable
  VideoPlayerController videoPlayerController;

  @observable
  double Function(double) getProgress;

  @observable
  double progress;

  @observable
  double seconds;

  @observable
  bool playerOk;

  @action
  Future<void> initializePlayerController() async {
    if (playerOk != null) {
      return;
    }

    playerOk = false;

    videoPlayerController = VideoPlayerController.network(episodeUrlPlaying);

    videoPlayerController.addListener(() {
      runInAction(() {
        seconds = videoPlayerController.value.position.inSeconds.toDouble();
      });
    });

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    await videoPlayerController.initialize();
    await videoPlayerController.play();

    runInAction(() {
      getProgress = Utils.interpolate(
          xInterval: [0, videoPlayerController.value.duration.inSeconds * 0.8],
          yInterval: [0, 100]);

      playerOk = true;
    });
  }

  Future<void> destroyPlayer() async {
    playerOk = false;

    progress = getProgress(seconds);

    setEpisodeStats(episodeIdPlaying, progress);

    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.bottom, SystemUiOverlay.top]);

    await videoPlayerController.dispose();

    videoPlayerController = null;
    getProgress = null;
    progress = null;
    seconds = null;
    playerOk = null;
  }

  void a() {
    videoPlayerController.seekTo(Duration(minutes: 10));
  }

  @action
  void dispose() {
    loadingLatests = true;
    latestsError = null;
    latests = null;

    loadingTrending = true;
    trendingError = null;
    trending = null;

    loadingRandom = true;
    randomError = null;
    random = null;
    loadingMoreRandom = false;
    randomLoadingMoreError = null;

    loadingFavorites = true;
    favoritesError = null;
    favorites = null;
  }
}
