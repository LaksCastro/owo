import 'package:anime_dart/app/core/browsing/domain/entities/episode.dart';
import 'package:anime_dart/app/modules/home/screens/latest/widget/list.dart';
import 'package:anime_dart/app/modules/home/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LatestsScreen extends StatefulWidget {
  LatestsScreen({Key key}) : super(key: key);

  @override
  _LatestsScreenState createState() => _LatestsScreenState();
}

class _LatestsScreenState extends ModularState<LatestsScreen, HomeStore> {
  @override
  void initState() {
    super.initState();

    controller.loadLatests();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(builder: (_) {
        if (controller.loadingLatests) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.latestsError != null) {
          return Center(
              child: Column(
            children: [
              Text(controller.latestsError),
              FlatButton(
                  onPressed: controller.loadLatests,
                  child: Text("Tentar novamente"))
            ],
          ));
        }

        return LatestsList(
            linkBuilder: (Episode episode) {
              void onTap() {
                controller.setWatchEpisodeId(episode.id);

                Modular.to.pushNamed("/watch-episode");
              }

              return onTap;
            },
            episodes: controller.latests,
            cardLabel: "LANÇAMENTOS",
            onRefresh: controller.loadLatests);
      }),
    );
  }
}
