import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:anime_dart/app/modules/home/screens/random/widget/list.dart';
import 'package:anime_dart/app/modules/home/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RandomScreen extends StatefulWidget {
  RandomScreen({Key key}) : super(key: key);

  @override
  _RandomScreenState createState() => _RandomScreenState();
}

class _RandomScreenState extends ModularState<RandomScreen, HomeStore> {
  ScrollController _scrollController;

  void _onListScroll() {
    if (controller.loadingMoreRandom) {
      return;
    }

    if (_scrollController.offset >=
            (_scrollController.position.maxScrollExtent - 300) &&
        !_scrollController.position.outOfRange) {
      controller.loadMoreRandom();
    }
  }

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_onListScroll);

    controller.loadRandom();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(builder: (_) {
        if (controller.loadingRandom) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.randomError != null) {
          return Center(
              child: Column(
            children: [
              Text(controller.randomError),
              FlatButton(
                  onPressed: controller.loadRandom,
                  child: Text("Tentar novamente"))
            ],
          ));
        }

        return RandomList(
            scrollController: _scrollController,
            linkBuilder: (Anime anime) {
              void onTap() {
                controller.setAnimeDetailsId(anime.id);

                Modular.to.pushNamed("/anime-details");
              }

              return onTap;
            },
            animes: controller.random.toList(),
            cardLabel: "ALEATÓRIO",
            onRefresh: controller.loadRandom);
      }),
    );
  }
}
