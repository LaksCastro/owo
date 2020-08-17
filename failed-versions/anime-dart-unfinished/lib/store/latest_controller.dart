import 'package:mobx/mobx.dart';
import 'package:anime_dart/models/resource.dart';

import 'package:anime_dart/providers/barrel.dart';

part 'latest_controller.g.dart';

class LatestController = _LatestControllerBase with _$LatestController;

abstract class _LatestControllerBase with Store {
  final _provider = LatestProvider();

  @observable
  ObservableList<Resource> episodes;

  @computed
  bool get loading => episodes == null || episodes.length == 0;

  @action
  loadEpisodes() async {
    episodes = ObservableList<Resource>.of([]);

    final newEpisodes = await _provider.getLatest();

    runInAction(() {
      episodes.addAll(ObservableList<Resource>.of(newEpisodes));
    });
  }
}
