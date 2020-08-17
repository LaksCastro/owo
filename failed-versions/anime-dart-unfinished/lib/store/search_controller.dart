import 'package:anime_dart/models/barrel.dart';
import 'package:mobx/mobx.dart';
import "package:anime_dart/providers/search_provider.dart";

part 'search_controller.g.dart';

class SearchController = _SearchControllerBase with _$SearchController;

abstract class _SearchControllerBase with Store {
  final _provider = SearchProvider();

  @observable
  String text = "";

  @observable
  var results = ObservableList<Resource>.of([]);

  @observable
  bool notFound;

  @computed
  bool get waitingType => text == "";

  @computed
  bool get loading => text != "" && notFound == null;

  @action
  setText(value) {
    text = value;
  }

  @action
  loadResults() async {
    final keyword = _provider.getKeyword(text);

    notFound = null;

    final searchedResources = await _provider.searchByKeyword(keyword);

    if (searchedResources.length == 0) {
      return runInAction(() {
        notFound = true;
        results = ObservableList<Resource>.of([]);
      });
    }

    runInAction(() {
      results = ObservableList<Resource>.of(searchedResources);
      notFound = false;
    });
  }

  @action
  dispose() {
    text = "";
    results = ObservableList<Resource>.of([]);
    notFound = null;
  }
}
