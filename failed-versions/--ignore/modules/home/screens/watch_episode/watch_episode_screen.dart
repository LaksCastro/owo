import 'package:anime_dart/app/modules/home/screens/watch_episode/widgets/watch_episode_buttons.dart';
import 'package:anime_dart/app/modules/home/screens/watch_episode/widgets/watch_episode_header.dart';
import 'package:anime_dart/app/modules/home/store/home_store.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WatchEpisodeScreen extends StatefulWidget {
  @override
  _WatchEpisodeScreenState createState() => _WatchEpisodeScreenState();
}

class _WatchEpisodeScreenState
    extends ModularState<WatchEpisodeScreen, HomeStore> {
  @override
  initState() {
    super.initState();

    controller.loadEpisode();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Container(child: Observer(builder: (_) {
          if (controller.loadingWatchEpisode) {
            return Text("Carregando...");
          }

          if (controller.errorMsg != null) {
            return Text("Ops, algo deu errado");
          }

          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(30),
            child: Text(
                "Ocorreu um erro ao carregar os dados deste episódio, tente novamente!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.5,
                )),
          );
        }))),
        body: Container(child: Observer(
          builder: (_) {
            if (controller.loadingWatchEpisode) {
              return Center(child: CircularProgressIndicator());
            }

            if (controller.errorMsg != null) {
              return Center(child: Text(controller.errorMsg));
            }

            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 0,
                ),
                child: IntrinsicHeight(
                  child: Container(
                      margin: EdgeInsets.only(bottom: 60),
                      child: Column(
                          children: [WatchEpisodeHeader(), WatchButtons()])),
                ),
              ),
            );
          },
        )),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (controller.loadingWatchEpisode) {
              return;
            }
            controller.setAnimeDetailsId(controller.episodeDetails.animeId);

            Modular.to.pushNamed("/anime-details");
          },
          label: Text('Ver lista de episódios'),
          icon: Icon(Icons.playlist_add_check),
        ));
  }
}
