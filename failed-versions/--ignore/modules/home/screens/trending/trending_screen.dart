import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:anime_dart/app/modules/home/screens/trending/widgets/list.dart';
import 'package:anime_dart/app/modules/home/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TrendingScreen extends StatefulWidget {
  TrendingScreen({Key key}) : super(key: key);

  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends ModularState<TrendingScreen, HomeStore> {
  @override
  void initState() {
    super.initState();

    controller.loadTrending();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(builder: (_) {
        if (controller.loadingTrending) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.trendingError != null) {
          return Center(
              child: Column(
            children: [
              Text(controller.trendingError),
              FlatButton(
                  onPressed: controller.loadTrending,
                  child: Text("Tentar novamente"))
            ],
          ));
        }

        return TrendingList(
            linkBuilder: (Anime anime) {
              void onTap() {
                controller.setAnimeDetailsId(anime.id);

                Modular.to.pushNamed("/anime-details");
              }

              return onTap;
            },
            animes: controller.trending,
            cardLabel: "POPULARES",
            onRefresh: controller.loadTrending);
      }),
    );
  }
}
