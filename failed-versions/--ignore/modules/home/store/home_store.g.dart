// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<bool> _$emptyFavoriteListComputed;

  @override
  bool get emptyFavoriteList => (_$emptyFavoriteListComputed ??= Computed<bool>(
          () => super.emptyFavoriteList,
          name: '_HomeStoreBase.emptyFavoriteList'))
      .value;
  Computed<bool> _$searchModeComputed;

  @override
  bool get searchMode =>
      (_$searchModeComputed ??= Computed<bool>(() => super.searchMode,
              name: '_HomeStoreBase.searchMode'))
          .value;
  Computed<bool> _$notFoundInternalSearchComputed;

  @override
  bool get notFoundInternalSearch => (_$notFoundInternalSearchComputed ??=
          Computed<bool>(() => super.notFoundInternalSearch,
              name: '_HomeStoreBase.notFoundInternalSearch'))
      .value;
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_HomeStoreBase.loading'))
      .value;

  final _$latestsAtom = Atom(name: '_HomeStoreBase.latests');

  @override
  ObservableList<Episode> get latests {
    _$latestsAtom.reportRead();
    return super.latests;
  }

  @override
  set latests(ObservableList<Episode> value) {
    _$latestsAtom.reportWrite(value, super.latests, () {
      super.latests = value;
    });
  }

  final _$loadingLatestsAtom = Atom(name: '_HomeStoreBase.loadingLatests');

  @override
  bool get loadingLatests {
    _$loadingLatestsAtom.reportRead();
    return super.loadingLatests;
  }

  @override
  set loadingLatests(bool value) {
    _$loadingLatestsAtom.reportWrite(value, super.loadingLatests, () {
      super.loadingLatests = value;
    });
  }

  final _$latestsErrorAtom = Atom(name: '_HomeStoreBase.latestsError');

  @override
  String get latestsError {
    _$latestsErrorAtom.reportRead();
    return super.latestsError;
  }

  @override
  set latestsError(String value) {
    _$latestsErrorAtom.reportWrite(value, super.latestsError, () {
      super.latestsError = value;
    });
  }

  final _$trendingAtom = Atom(name: '_HomeStoreBase.trending');

  @override
  ObservableList<Anime> get trending {
    _$trendingAtom.reportRead();
    return super.trending;
  }

  @override
  set trending(ObservableList<Anime> value) {
    _$trendingAtom.reportWrite(value, super.trending, () {
      super.trending = value;
    });
  }

  final _$loadingTrendingAtom = Atom(name: '_HomeStoreBase.loadingTrending');

  @override
  bool get loadingTrending {
    _$loadingTrendingAtom.reportRead();
    return super.loadingTrending;
  }

  @override
  set loadingTrending(bool value) {
    _$loadingTrendingAtom.reportWrite(value, super.loadingTrending, () {
      super.loadingTrending = value;
    });
  }

  final _$trendingErrorAtom = Atom(name: '_HomeStoreBase.trendingError');

  @override
  String get trendingError {
    _$trendingErrorAtom.reportRead();
    return super.trendingError;
  }

  @override
  set trendingError(String value) {
    _$trendingErrorAtom.reportWrite(value, super.trendingError, () {
      super.trendingError = value;
    });
  }

  final _$randomAtom = Atom(name: '_HomeStoreBase.random');

  @override
  ObservableList<Anime> get random {
    _$randomAtom.reportRead();
    return super.random;
  }

  @override
  set random(ObservableList<Anime> value) {
    _$randomAtom.reportWrite(value, super.random, () {
      super.random = value;
    });
  }

  final _$loadingRandomAtom = Atom(name: '_HomeStoreBase.loadingRandom');

  @override
  bool get loadingRandom {
    _$loadingRandomAtom.reportRead();
    return super.loadingRandom;
  }

  @override
  set loadingRandom(bool value) {
    _$loadingRandomAtom.reportWrite(value, super.loadingRandom, () {
      super.loadingRandom = value;
    });
  }

  final _$loadingMoreRandomAtom =
      Atom(name: '_HomeStoreBase.loadingMoreRandom');

  @override
  bool get loadingMoreRandom {
    _$loadingMoreRandomAtom.reportRead();
    return super.loadingMoreRandom;
  }

  @override
  set loadingMoreRandom(bool value) {
    _$loadingMoreRandomAtom.reportWrite(value, super.loadingMoreRandom, () {
      super.loadingMoreRandom = value;
    });
  }

  final _$randomErrorAtom = Atom(name: '_HomeStoreBase.randomError');

  @override
  String get randomError {
    _$randomErrorAtom.reportRead();
    return super.randomError;
  }

  @override
  set randomError(String value) {
    _$randomErrorAtom.reportWrite(value, super.randomError, () {
      super.randomError = value;
    });
  }

  final _$randomLoadingMoreErrorAtom =
      Atom(name: '_HomeStoreBase.randomLoadingMoreError');

  @override
  String get randomLoadingMoreError {
    _$randomLoadingMoreErrorAtom.reportRead();
    return super.randomLoadingMoreError;
  }

  @override
  set randomLoadingMoreError(String value) {
    _$randomLoadingMoreErrorAtom
        .reportWrite(value, super.randomLoadingMoreError, () {
      super.randomLoadingMoreError = value;
    });
  }

  final _$favoritesAtom = Atom(name: '_HomeStoreBase.favorites');

  @override
  ObservableList<Anime> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ObservableList<Anime> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  final _$loadingFavoritesAtom = Atom(name: '_HomeStoreBase.loadingFavorites');

  @override
  bool get loadingFavorites {
    _$loadingFavoritesAtom.reportRead();
    return super.loadingFavorites;
  }

  @override
  set loadingFavorites(bool value) {
    _$loadingFavoritesAtom.reportWrite(value, super.loadingFavorites, () {
      super.loadingFavorites = value;
    });
  }

  final _$favoritesErrorAtom = Atom(name: '_HomeStoreBase.favoritesError');

  @override
  String get favoritesError {
    _$favoritesErrorAtom.reportRead();
    return super.favoritesError;
  }

  @override
  set favoritesError(String value) {
    _$favoritesErrorAtom.reportWrite(value, super.favoritesError, () {
      super.favoritesError = value;
    });
  }

  final _$animeDetailsAtom = Atom(name: '_HomeStoreBase.animeDetails');

  @override
  AnimeDetails get animeDetails {
    _$animeDetailsAtom.reportRead();
    return super.animeDetails;
  }

  @override
  set animeDetails(AnimeDetails value) {
    _$animeDetailsAtom.reportWrite(value, super.animeDetails, () {
      super.animeDetails = value;
    });
  }

  final _$episodesOfAnimeDetailsAtom =
      Atom(name: '_HomeStoreBase.episodesOfAnimeDetails');

  @override
  ObservableList<EpisodeDetails> get episodesOfAnimeDetails {
    _$episodesOfAnimeDetailsAtom.reportRead();
    return super.episodesOfAnimeDetails;
  }

  @override
  set episodesOfAnimeDetails(ObservableList<EpisodeDetails> value) {
    _$episodesOfAnimeDetailsAtom
        .reportWrite(value, super.episodesOfAnimeDetails, () {
      super.episodesOfAnimeDetails = value;
    });
  }

  final _$errorAtom = Atom(name: '_HomeStoreBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$internalSearchAtom = Atom(name: '_HomeStoreBase.internalSearch');

  @override
  String get internalSearch {
    _$internalSearchAtom.reportRead();
    return super.internalSearch;
  }

  @override
  set internalSearch(String value) {
    _$internalSearchAtom.reportWrite(value, super.internalSearch, () {
      super.internalSearch = value;
    });
  }

  final _$filteredEpisodesAtom = Atom(name: '_HomeStoreBase.filteredEpisodes');

  @override
  ObservableList<EpisodeDetails> get filteredEpisodes {
    _$filteredEpisodesAtom.reportRead();
    return super.filteredEpisodes;
  }

  @override
  set filteredEpisodes(ObservableList<EpisodeDetails> value) {
    _$filteredEpisodesAtom.reportWrite(value, super.filteredEpisodes, () {
      super.filteredEpisodes = value;
    });
  }

  final _$showSearchAtom = Atom(name: '_HomeStoreBase.showSearch');

  @override
  bool get showSearch {
    _$showSearchAtom.reportRead();
    return super.showSearch;
  }

  @override
  set showSearch(bool value) {
    _$showSearchAtom.reportWrite(value, super.showSearch, () {
      super.showSearch = value;
    });
  }

  final _$episodeIdPlayingAtom = Atom(name: '_HomeStoreBase.episodeIdPlaying');

  @override
  String get episodeIdPlaying {
    _$episodeIdPlayingAtom.reportRead();
    return super.episodeIdPlaying;
  }

  @override
  set episodeIdPlaying(String value) {
    _$episodeIdPlayingAtom.reportWrite(value, super.episodeIdPlaying, () {
      super.episodeIdPlaying = value;
    });
  }

  final _$episodeUrlPlayingAtom =
      Atom(name: '_HomeStoreBase.episodeUrlPlaying');

  @override
  String get episodeUrlPlaying {
    _$episodeUrlPlayingAtom.reportRead();
    return super.episodeUrlPlaying;
  }

  @override
  set episodeUrlPlaying(String value) {
    _$episodeUrlPlayingAtom.reportWrite(value, super.episodeUrlPlaying, () {
      super.episodeUrlPlaying = value;
    });
  }

  final _$animeIdAtom = Atom(name: '_HomeStoreBase.animeId');

  @override
  String get animeId {
    _$animeIdAtom.reportRead();
    return super.animeId;
  }

  @override
  set animeId(String value) {
    _$animeIdAtom.reportWrite(value, super.animeId, () {
      super.animeId = value;
    });
  }

  final _$episodeDetailsAtom = Atom(name: '_HomeStoreBase.episodeDetails');

  @override
  EpisodeDetails get episodeDetails {
    _$episodeDetailsAtom.reportRead();
    return super.episodeDetails;
  }

  @override
  set episodeDetails(EpisodeDetails value) {
    _$episodeDetailsAtom.reportWrite(value, super.episodeDetails, () {
      super.episodeDetails = value;
    });
  }

  final _$loadingWatchEpisodeAtom =
      Atom(name: '_HomeStoreBase.loadingWatchEpisode');

  @override
  bool get loadingWatchEpisode {
    _$loadingWatchEpisodeAtom.reportRead();
    return super.loadingWatchEpisode;
  }

  @override
  set loadingWatchEpisode(bool value) {
    _$loadingWatchEpisodeAtom.reportWrite(value, super.loadingWatchEpisode, () {
      super.loadingWatchEpisode = value;
    });
  }

  final _$loadingOtherEpisodeAtom =
      Atom(name: '_HomeStoreBase.loadingOtherEpisode');

  @override
  bool get loadingOtherEpisode {
    _$loadingOtherEpisodeAtom.reportRead();
    return super.loadingOtherEpisode;
  }

  @override
  set loadingOtherEpisode(bool value) {
    _$loadingOtherEpisodeAtom.reportWrite(value, super.loadingOtherEpisode, () {
      super.loadingOtherEpisode = value;
    });
  }

  final _$errorMsgAtom = Atom(name: '_HomeStoreBase.errorMsg');

  @override
  String get errorMsg {
    _$errorMsgAtom.reportRead();
    return super.errorMsg;
  }

  @override
  set errorMsg(String value) {
    _$errorMsgAtom.reportWrite(value, super.errorMsg, () {
      super.errorMsg = value;
    });
  }

  final _$episodeIdAtom = Atom(name: '_HomeStoreBase.episodeId');

  @override
  String get episodeId {
    _$episodeIdAtom.reportRead();
    return super.episodeId;
  }

  @override
  set episodeId(String value) {
    _$episodeIdAtom.reportWrite(value, super.episodeId, () {
      super.episodeId = value;
    });
  }

  final _$videoPlayerControllerAtom =
      Atom(name: '_HomeStoreBase.videoPlayerController');

  @override
  VideoPlayerController get videoPlayerController {
    _$videoPlayerControllerAtom.reportRead();
    return super.videoPlayerController;
  }

  @override
  set videoPlayerController(VideoPlayerController value) {
    _$videoPlayerControllerAtom.reportWrite(value, super.videoPlayerController,
        () {
      super.videoPlayerController = value;
    });
  }

  final _$getProgressAtom = Atom(name: '_HomeStoreBase.getProgress');

  @override
  double Function(double) get getProgress {
    _$getProgressAtom.reportRead();
    return super.getProgress;
  }

  @override
  set getProgress(double Function(double) value) {
    _$getProgressAtom.reportWrite(value, super.getProgress, () {
      super.getProgress = value;
    });
  }

  final _$progressAtom = Atom(name: '_HomeStoreBase.progress');

  @override
  double get progress {
    _$progressAtom.reportRead();
    return super.progress;
  }

  @override
  set progress(double value) {
    _$progressAtom.reportWrite(value, super.progress, () {
      super.progress = value;
    });
  }

  final _$secondsAtom = Atom(name: '_HomeStoreBase.seconds');

  @override
  double get seconds {
    _$secondsAtom.reportRead();
    return super.seconds;
  }

  @override
  set seconds(double value) {
    _$secondsAtom.reportWrite(value, super.seconds, () {
      super.seconds = value;
    });
  }

  final _$playerOkAtom = Atom(name: '_HomeStoreBase.playerOk');

  @override
  bool get playerOk {
    _$playerOkAtom.reportRead();
    return super.playerOk;
  }

  @override
  set playerOk(bool value) {
    _$playerOkAtom.reportWrite(value, super.playerOk, () {
      super.playerOk = value;
    });
  }

  final _$loadLatestsAsyncAction = AsyncAction('_HomeStoreBase.loadLatests');

  @override
  Future<void> loadLatests() {
    return _$loadLatestsAsyncAction.run(() => super.loadLatests());
  }

  final _$loadTrendingAsyncAction = AsyncAction('_HomeStoreBase.loadTrending');

  @override
  Future<void> loadTrending() {
    return _$loadTrendingAsyncAction.run(() => super.loadTrending());
  }

  final _$loadRandomAsyncAction = AsyncAction('_HomeStoreBase.loadRandom');

  @override
  Future<void> loadRandom() {
    return _$loadRandomAsyncAction.run(() => super.loadRandom());
  }

  final _$loadMoreRandomAsyncAction =
      AsyncAction('_HomeStoreBase.loadMoreRandom');

  @override
  Future<void> loadMoreRandom() {
    return _$loadMoreRandomAsyncAction.run(() => super.loadMoreRandom());
  }

  final _$loadFavoritesAsyncAction =
      AsyncAction('_HomeStoreBase.loadFavorites');

  @override
  Future<void> loadFavorites() {
    return _$loadFavoritesAsyncAction.run(() => super.loadFavorites());
  }

  final _$loadAnimeDetailsAsyncAction =
      AsyncAction('_HomeStoreBase.loadAnimeDetails');

  @override
  Future<void> loadAnimeDetails() {
    return _$loadAnimeDetailsAsyncAction.run(() => super.loadAnimeDetails());
  }

  final _$toggleFavoriteAsyncAction =
      AsyncAction('_HomeStoreBase.toggleFavorite');

  @override
  Future<void> toggleFavorite() {
    return _$toggleFavoriteAsyncAction.run(() => super.toggleFavorite());
  }

  final _$setEpisodeStatsOnAnimeDetailsAsyncAction =
      AsyncAction('_HomeStoreBase.setEpisodeStatsOnAnimeDetails');

  @override
  Future<void> setEpisodeStatsOnAnimeDetails(
      String episodeId, double newStats) {
    return _$setEpisodeStatsOnAnimeDetailsAsyncAction
        .run(() => super.setEpisodeStatsOnAnimeDetails(episodeId, newStats));
  }

  final _$setEpisodeStatsAsyncAction =
      AsyncAction('_HomeStoreBase.setEpisodeStats');

  @override
  Future<void> setEpisodeStats(String episodeId, double newStats) {
    return _$setEpisodeStatsAsyncAction
        .run(() => super.setEpisodeStats(episodeId, newStats));
  }

  final _$loadEpisodeAsyncAction = AsyncAction('_HomeStoreBase.loadEpisode');

  @override
  Future<void> loadEpisode() {
    return _$loadEpisodeAsyncAction.run(() => super.loadEpisode());
  }

  final _$loadNextEpisodeAsyncAction =
      AsyncAction('_HomeStoreBase.loadNextEpisode');

  @override
  Future<void> loadNextEpisode() {
    return _$loadNextEpisodeAsyncAction.run(() => super.loadNextEpisode());
  }

  final _$loadPrevEpisodeAsyncAction =
      AsyncAction('_HomeStoreBase.loadPrevEpisode');

  @override
  Future<void> loadPrevEpisode() {
    return _$loadPrevEpisodeAsyncAction.run(() => super.loadPrevEpisode());
  }

  final _$initializePlayerControllerAsyncAction =
      AsyncAction('_HomeStoreBase.initializePlayerController');

  @override
  Future<void> initializePlayerController() {
    return _$initializePlayerControllerAsyncAction
        .run(() => super.initializePlayerController());
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void setAnimeDetailsId(String newAnimeId) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setAnimeDetailsId');
    try {
      return super.setAnimeDetailsId(newAnimeId);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic showSearchField(bool yesOrNo) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.showSearchField');
    try {
      return super.showSearchField(yesOrNo);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInternalSearch(String keyword) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setInternalSearch');
    try {
      return super.setInternalSearch(keyword);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic closeSearchMode() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.closeSearchMode');
    try {
      return super.closeSearchMode();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterEpisodes() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.filterEpisodes');
    try {
      return super.filterEpisodes();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlayerEpisode(String targetEpisodeId, String url) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setPlayerEpisode');
    try {
      return super.setPlayerEpisode(targetEpisodeId, url);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setWatchEpisodeId(String newEpisodeId) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setWatchEpisodeId');
    try {
      return super.setWatchEpisodeId(newEpisodeId);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
latests: ${latests},
loadingLatests: ${loadingLatests},
latestsError: ${latestsError},
trending: ${trending},
loadingTrending: ${loadingTrending},
trendingError: ${trendingError},
random: ${random},
loadingRandom: ${loadingRandom},
loadingMoreRandom: ${loadingMoreRandom},
randomError: ${randomError},
randomLoadingMoreError: ${randomLoadingMoreError},
favorites: ${favorites},
loadingFavorites: ${loadingFavorites},
favoritesError: ${favoritesError},
animeDetails: ${animeDetails},
episodesOfAnimeDetails: ${episodesOfAnimeDetails},
error: ${error},
internalSearch: ${internalSearch},
filteredEpisodes: ${filteredEpisodes},
showSearch: ${showSearch},
episodeIdPlaying: ${episodeIdPlaying},
episodeUrlPlaying: ${episodeUrlPlaying},
animeId: ${animeId},
episodeDetails: ${episodeDetails},
loadingWatchEpisode: ${loadingWatchEpisode},
loadingOtherEpisode: ${loadingOtherEpisode},
errorMsg: ${errorMsg},
episodeId: ${episodeId},
videoPlayerController: ${videoPlayerController},
getProgress: ${getProgress},
progress: ${progress},
seconds: ${seconds},
playerOk: ${playerOk},
emptyFavoriteList: ${emptyFavoriteList},
searchMode: ${searchMode},
notFoundInternalSearch: ${notFoundInternalSearch},
loading: ${loading}
    ''';
  }
}
