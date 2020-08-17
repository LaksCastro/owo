// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LatestController on _LatestControllerBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_LatestControllerBase.loading'))
      .value;

  final _$episodesAtom = Atom(name: '_LatestControllerBase.episodes');

  @override
  ObservableList<Resource> get episodes {
    _$episodesAtom.reportRead();
    return super.episodes;
  }

  @override
  set episodes(ObservableList<Resource> value) {
    _$episodesAtom.reportWrite(value, super.episodes, () {
      super.episodes = value;
    });
  }

  final _$loadEpisodesAsyncAction =
      AsyncAction('_LatestControllerBase.loadEpisodes');

  @override
  Future loadEpisodes() {
    return _$loadEpisodesAsyncAction.run(() => super.loadEpisodes());
  }

  @override
  String toString() {
    return '''
episodes: ${episodes},
loading: ${loading}
    ''';
  }
}
