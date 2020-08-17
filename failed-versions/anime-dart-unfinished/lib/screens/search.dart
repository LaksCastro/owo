import 'dart:async';

import 'package:anime_dart/components/barrel.dart';
import 'package:anime_dart/get_it.dart';
import 'package:anime_dart/store/barrel.dart';
import "package:flutter/material.dart";
import 'package:flutter_mobx/flutter_mobx.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _searchController = getIt<SearchController>();
  final _searchQuery = TextEditingController();
  Timer _debounce;

  _onSearchChanged() {
    if (_debounce?.isActive ?? false) {
      _debounce.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      final text = _searchQuery.text;

      if (text == _searchController.text) {
        return;
      }

      _searchController.setText(text);
      _searchController.loadResults();
    });
  }

  @override
  initState() {
    super.initState();
    _searchQuery.addListener(_onSearchChanged);
  }

  @override
  dispose() {
    _searchQuery?.removeListener(_onSearchChanged);
    _searchQuery?.dispose();
    _debounce?.cancel();

    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
            backgroundColor: Theme.of(context).backgroundColor,
            title: TextField(
                autofocus: true,
                cursorColor: Theme.of(context).textTheme.bodyText1.color,
                decoration: InputDecoration.collapsed(
                    hintStyle: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color
                            .withOpacity(0.5)),
                    hintText: 'Digite uma palavra chave'),
                controller: _searchQuery)),
        body: Observer(
          builder: (_) {
            if (_searchController.waitingType) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(20),
                          child: Text(
                              "Digite o nome de um anime para procurar...")))
                ],
              );
            }

            if (_searchController.loading) {
              return Center(child: CircularProgressIndicator());
            }

            if (_searchController.notFound) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(20),
                          child: Text(
                              "Anime não encontrado, tente outra palavra chave...")))
                ],
              );
            }

            return ResourceList(
                resources: _searchController.results,
                cardLabel: "RESULTADOS",
                onRefresh: _searchController.loadResults);
          },
        ));
  }
}
