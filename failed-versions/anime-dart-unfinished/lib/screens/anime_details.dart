import 'dart:async';

import 'package:anime_dart/get_it.dart';
import 'package:anime_dart/store/barrel.dart';
import 'package:flutter/material.dart';

import "package:anime_dart/models/barrel.dart";
import "package:anime_dart/components/barrel.dart";
import 'package:flutter_mobx/flutter_mobx.dart';

class AnimeDetails extends StatefulWidget {
  final AnimeDetailsArgs args;

  AnimeDetails({this.args});

  @override
  _AnimeDetailsState createState() => _AnimeDetailsState(args: args);
}

class _AnimeDetailsState extends State<AnimeDetails> {
  final AnimeDetailsArgs args;

  final _animeDetailsController = getIt<AnimeDetailsController>();
  final _searchQuery = TextEditingController();
  Timer _debounce;

  _AnimeDetailsState({this.args});

  _onSearchChanged() {
    if (_debounce?.isActive ?? false) {
      _debounce.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      final text = _searchQuery.text;

      if (text == _animeDetailsController.internalSearch) {
        return;
      }

      _animeDetailsController.setInternalSearch(text);
      _animeDetailsController.filterEpisodes();
    });
  }

  _enableSearchMode() {
    _animeDetailsController.showSearchField(true);
  }

  _closeSearchMode() {
    _searchQuery.clear();
    _animeDetailsController.closeSearchMode();
  }

  Future<bool> _preventDefaultReturn() async {
    _closeSearchMode();

    return Future(() {
      return false;
    });
  }

  @override
  void initState() {
    super.initState();

    _animeDetailsController.loadDetails(args.animeId);

    _searchQuery.addListener(_onSearchChanged);
  }

  void dispose() {
    _animeDetailsController.dispose();

    _searchQuery?.removeListener(_onSearchChanged);
    _searchQuery?.dispose();
    _debounce?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Observer(builder: (_) {
          if (_animeDetailsController.loading) {
            return Text(args.title);
          }

          if (_animeDetailsController.showSearch) {
            return Row(children: [
              Expanded(
                  child: TextField(
                      autofocus: true,
                      style: TextStyle(
                          color: Theme.of(context).primaryIconTheme.color),
                      cursorColor: Theme.of(context).primaryIconTheme.color,
                      decoration: InputDecoration.collapsed(
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .primaryIconTheme
                                  .color
                                  .withOpacity(0.5)),
                          hintText: 'Digite o número do episódio'),
                      controller: _searchQuery)),
              GestureDetector(
                  onTap: _closeSearchMode,
                  child: Container(
                      height: 40,
                      width: 50,
                      child: Icon(Icons.close),
                      alignment: Alignment.centerRight))
            ]);
          }

          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(_animeDetailsController.details.title)),
                GestureDetector(
                    onTap: _enableSearchMode,
                    child: Container(
                        height: 40,
                        width: 50,
                        child: Icon(Icons.search),
                        alignment: Alignment.centerRight))
              ]);
        })),
        body: Observer(builder: (_) {
          if (_animeDetailsController.loading) {
            // WHEN IS LOADING EPISODES FROM API
            return Center(child: CircularProgressIndicator());
          }

          if (!_animeDetailsController.searchMode &&
              !_animeDetailsController.showSearch) {
            // WHEN SEARCH MODE IS DISABLED, THAT IS: THE NORMAL MODE
            return ListView.separated(
              padding: EdgeInsets.only(bottom: 85),
              separatorBuilder: (_, i) => Container(
                  color: Colors.transparent, height: i == 0 ? 20 : 10),
              itemCount: _animeDetailsController.episodes.length + 1,
              itemBuilder: (_, i) {
                if (i == 0) {
                  return AnimeDetailsHeader(
                      details: _animeDetailsController.details);
                }

                final episode = _animeDetailsController.episodes[i - 1];

                return AnimeDetailsEpisodesTile(
                  episode: episode,
                );
              },
            );
          }

          if (_animeDetailsController.searchMode) {
            if (_animeDetailsController.notFoundInternalSearch) {
              // WHEN SEARCH MODE IS ENABLED BUT NOT FOUND RESULTS
              return WillPopScope(
                  onWillPop: _preventDefaultReturn,
                  child: Center(
                      child: Text(
                          "Não foi posível encontrar o episódio especificado")));
            }

            // WHEN SEARCH MODE IS ENABLED AND FOUND RESULTS
            return WillPopScope(
                onWillPop: _preventDefaultReturn,
                child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 85, top: 10),
                  separatorBuilder: (_, i) =>
                      Container(color: Colors.transparent, height: 10),
                  itemCount: _animeDetailsController.filteredEpisodes.length,
                  itemBuilder: (_, i) {
                    final episode = _animeDetailsController.filteredEpisodes[i];

                    return AnimeDetailsEpisodesTile(
                      episode: episode,
                    );
                  },
                ));
          } else {
            // WHEN SEARCH MODE IS ENABLED BUT SEARCH INPUT IS EMPTY
            return WillPopScope(
                onWillPop: _preventDefaultReturn,
                child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 85, top: 10),
                  separatorBuilder: (_, i) =>
                      Container(color: Colors.transparent, height: 10),
                  itemCount: _animeDetailsController.episodes.length,
                  itemBuilder: (_, i) {
                    final episode = _animeDetailsController.episodes[i];

                    return AnimeDetailsEpisodesTile(
                      episode: episode,
                    );
                  },
                ));
          }
        }),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).backgroundColor,
            onPressed: () {},
            child: Icon(Icons.favorite, color: Colors.red[300])));
  }
}
