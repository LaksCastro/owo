// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_episode_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WatchEpisodeController on _WatchEpisodeControllerBase, Store {
  Computed<bool> _$loadingVideoUrlComputed;

  @override
  bool get loadingVideoUrl =>
      (_$loadingVideoUrlComputed ??= Computed<bool>(() => super.loadingVideoUrl,
              name: '_WatchEpisodeControllerBase.loadingVideoUrl'))
          .value;

  final _$labelAtom = Atom(name: '_WatchEpisodeControllerBase.label');

  @override
  String get label {
    _$labelAtom.reportRead();
    return super.label;
  }

  @override
  set label(String value) {
    _$labelAtom.reportWrite(value, super.label, () {
      super.label = value;
    });
  }

  final _$imageUrlAtom = Atom(name: '_WatchEpisodeControllerBase.imageUrl');

  @override
  String get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(String value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  final _$episodeIdAtom = Atom(name: '_WatchEpisodeControllerBase.episodeId');

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

  final _$videoUrlHdAtom = Atom(name: '_WatchEpisodeControllerBase.videoUrlHd');

  @override
  String get videoUrlHd {
    _$videoUrlHdAtom.reportRead();
    return super.videoUrlHd;
  }

  @override
  set videoUrlHd(String value) {
    _$videoUrlHdAtom.reportWrite(value, super.videoUrlHd, () {
      super.videoUrlHd = value;
    });
  }

  final _$videoUrlAtom = Atom(name: '_WatchEpisodeControllerBase.videoUrl');

  @override
  String get videoUrl {
    _$videoUrlAtom.reportRead();
    return super.videoUrl;
  }

  @override
  set videoUrl(String value) {
    _$videoUrlAtom.reportWrite(value, super.videoUrl, () {
      super.videoUrl = value;
    });
  }

  final _$animeIdAtom = Atom(name: '_WatchEpisodeControllerBase.animeId');

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

  final _$loadVideoUrlAsyncAction =
      AsyncAction('_WatchEpisodeControllerBase.loadVideoUrl');

  @override
  Future loadVideoUrl() {
    return _$loadVideoUrlAsyncAction.run(() => super.loadVideoUrl());
  }

  final _$_WatchEpisodeControllerBaseActionController =
      ActionController(name: '_WatchEpisodeControllerBase');

  @override
  dynamic setEpisodeInfo(
      {@required String labelValue,
      @required String imageUrlValue,
      @required String episodeIdValue,
      @required String animeIdValue}) {
    final _$actionInfo = _$_WatchEpisodeControllerBaseActionController
        .startAction(name: '_WatchEpisodeControllerBase.setEpisodeInfo');
    try {
      return super.setEpisodeInfo(
          labelValue: labelValue,
          imageUrlValue: imageUrlValue,
          episodeIdValue: episodeIdValue,
          animeIdValue: animeIdValue);
    } finally {
      _$_WatchEpisodeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$_WatchEpisodeControllerBaseActionController
        .startAction(name: '_WatchEpisodeControllerBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_WatchEpisodeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
label: ${label},
imageUrl: ${imageUrl},
episodeId: ${episodeId},
videoUrlHd: ${videoUrlHd},
videoUrl: ${videoUrl},
animeId: ${animeId},
loadingVideoUrl: ${loadingVideoUrl}
    ''';
  }
}
