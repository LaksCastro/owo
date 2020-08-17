// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnimeDetailsController on _AnimeDetailsControllerBase, Store {
  Computed<bool> _$searchModeComputed;

  @override
  bool get searchMode =>
      (_$searchModeComputed ??= Computed<bool>(() => super.searchMode,
              name: '_AnimeDetailsControllerBase.searchMode'))
          .value;
  Computed<bool> _$notFoundInternalSearchComputed;

  @override
  bool get notFoundInternalSearch => (_$notFoundInternalSearchComputed ??=
          Computed<bool>(() => super.notFoundInternalSearch,
              name: '_AnimeDetailsControllerBase.notFoundInternalSearch'))
      .value;
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_AnimeDetailsControllerBase.loading'))
      .value;

  final _$detailsAtom = Atom(name: '_AnimeDetailsControllerBase.details');

  @override
  AnimeDetails get details {
    _$detailsAtom.reportRead();
    return super.details;
  }

  @override
  set details(AnimeDetails value) {
    _$detailsAtom.reportWrite(value, super.details, () {
      super.details = value;
    });
  }

  final _$episodesAtom = Atom(name: '_AnimeDetailsControllerBase.episodes');

  @override
  ObservableList<EpisodeInfo> get episodes {
    _$episodesAtom.reportRead();
    return super.episodes;
  }

  @override
  set episodes(ObservableList<EpisodeInfo> value) {
    _$episodesAtom.reportWrite(value, super.episodes, () {
      super.episodes = value;
    });
  }

  final _$errorAtom = Atom(name: '_AnimeDetailsControllerBase.error');

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$internalSearchAtom =
      Atom(name: '_AnimeDetailsControllerBase.internalSearch');

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

  final _$filteredEpisodesAtom =
      Atom(name: '_AnimeDetailsControllerBase.filteredEpisodes');

  @override
  ObservableList<EpisodeInfo> get filteredEpisodes {
    _$filteredEpisodesAtom.reportRead();
    return super.filteredEpisodes;
  }

  @override
  set filteredEpisodes(ObservableList<EpisodeInfo> value) {
    _$filteredEpisodesAtom.reportWrite(value, super.filteredEpisodes, () {
      super.filteredEpisodes = value;
    });
  }

  final _$showSearchAtom = Atom(name: '_AnimeDetailsControllerBase.showSearch');

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

  final _$loadDetailsAsyncAction =
      AsyncAction('_AnimeDetailsControllerBase.loadDetails');

  @override
  Future loadDetails(String animeId) {
    return _$loadDetailsAsyncAction.run(() => super.loadDetails(animeId));
  }

  final _$_AnimeDetailsControllerBaseActionController =
      ActionController(name: '_AnimeDetailsControllerBase');

  @override
  dynamic showSearchField(bool yesOrNo) {
    final _$actionInfo = _$_AnimeDetailsControllerBaseActionController
        .startAction(name: '_AnimeDetailsControllerBase.showSearchField');
    try {
      return super.showSearchField(yesOrNo);
    } finally {
      _$_AnimeDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateProgressOnEpisode(String episodeId, double newProgress) {
    final _$actionInfo =
        _$_AnimeDetailsControllerBaseActionController.startAction(
            name: '_AnimeDetailsControllerBase.updateProgressOnEpisode');
    try {
      return super.updateProgressOnEpisode(episodeId, newProgress);
    } finally {
      _$_AnimeDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInternalSearch(String keyword) {
    final _$actionInfo = _$_AnimeDetailsControllerBaseActionController
        .startAction(name: '_AnimeDetailsControllerBase.setInternalSearch');
    try {
      return super.setInternalSearch(keyword);
    } finally {
      _$_AnimeDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic closeSearchMode() {
    final _$actionInfo = _$_AnimeDetailsControllerBaseActionController
        .startAction(name: '_AnimeDetailsControllerBase.closeSearchMode');
    try {
      return super.closeSearchMode();
    } finally {
      _$_AnimeDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterEpisodes() {
    final _$actionInfo = _$_AnimeDetailsControllerBaseActionController
        .startAction(name: '_AnimeDetailsControllerBase.filterEpisodes');
    try {
      return super.filterEpisodes();
    } finally {
      _$_AnimeDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$_AnimeDetailsControllerBaseActionController
        .startAction(name: '_AnimeDetailsControllerBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_AnimeDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
details: ${details},
episodes: ${episodes},
error: ${error},
internalSearch: ${internalSearch},
filteredEpisodes: ${filteredEpisodes},
showSearch: ${showSearch},
searchMode: ${searchMode},
notFoundInternalSearch: ${notFoundInternalSearch},
loading: ${loading}
    ''';
  }
}
