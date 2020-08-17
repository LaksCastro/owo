import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import "package:anime_dart/providers/watch_episode_provider.dart";

part 'watch_episode_controller.g.dart';

class WatchEpisodeController = _WatchEpisodeControllerBase
    with _$WatchEpisodeController;

abstract class _WatchEpisodeControllerBase with Store {
  final _provider = WatchEpisodeProvider();

  @observable
  String label;

  @observable
  String imageUrl;

  @observable
  String episodeId;

  @observable
  String videoUrlHd;

  @observable
  String videoUrl;

  @observable
  String animeId;

  @computed
  bool get loadingVideoUrl => videoUrl == null;

  @action
  setEpisodeInfo(
      {@required String labelValue,
      @required String imageUrlValue,
      @required String episodeIdValue,
      @required String animeIdValue}) {
    label = labelValue;
    imageUrl = imageUrlValue;
    episodeId = episodeIdValue;
    animeId = animeIdValue;
  }

  @action
  loadVideoUrl() async {
    if (episodeId == null) {
      throw Exception(
          "You need set the episode info before to call loadVideoUrl action");
    }

    final videoResource = await _provider.getVideo(episodeId);

    runInAction(() {
      videoUrlHd = videoResource.urlHd;
      videoUrl = videoResource.url;
    });
  }

  @action
  dispose() {
    label = null;
    imageUrl = null;
    episodeId = null;
    animeId = null;

    videoUrlHd = null;
    videoUrl = null;
  }
}
