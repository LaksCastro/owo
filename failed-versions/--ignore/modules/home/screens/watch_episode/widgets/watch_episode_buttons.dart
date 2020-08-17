import 'package:anime_dart/app/constants/utils.dart';
import 'package:anime_dart/app/modules/home/screens/watch_episode/widgets/ripple_button.dart';
import 'package:anime_dart/app/modules/home/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WatchButtons extends StatefulWidget {
  WatchButtons({Key key}) : super(key: key);

  @override
  _WatchButtonsState createState() => _WatchButtonsState();
}

class _WatchButtonsState extends ModularState<WatchButtons, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(builder: (_) {
        if (controller.loadingWatchEpisode || controller.loadingOtherEpisode) {
          return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
              child: CircularProgressIndicator());
        }

        return Column(children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            color: Theme.of(context).backgroundColor,
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Assistir Online:",
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .color
                              .withOpacity(0.5)))),
              controller.episodeDetails?.urlHd == null
                  ? (RippleButton(
                      color: Colors.black26,
                      onTap: () {},
                      label: "Esse episódio não está disponível em HD"))
                  : (RippleButton(
                      color: Theme.of(context).colorScheme.secondary,
                      onTap: () {
                        if (controller.episodeDetails?.urlHd == null) {
                          return;
                        }
                        controller.setPlayerEpisode(
                            controller.episodeDetails.id,
                            controller.episodeDetails.urlHd);

                        Modular.to.pushNamed("/play-episode");
                      },
                      label: "Assistir em HD")),
              RippleButton(
                  color: Theme.of(context).colorScheme.secondaryVariant,
                  onTap: () {
                    if (controller.episodeDetails?.url == null) {
                      return;
                    }

                    controller.setPlayerEpisode(controller.episodeDetails.id,
                        controller.episodeDetails.url);

                    Modular.to.pushNamed("/play-episode");
                  },
                  label: "Assistir"),
            ]),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            color: Theme.of(context).backgroundColor,
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Fazer Download:",
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .color
                              .withOpacity(0.5)))),
              controller.episodeDetails?.urlHd == null
                  ? (RippleButton(
                      color: Colors.black26,
                      onTap: () {},
                      label: "Esse episódio não está disponível em HD"))
                  : (RippleButton(
                      color: Theme.of(context).colorScheme.secondary,
                      onTap: () {
                        if (controller.episodeDetails?.urlHd == null) {
                          return;
                        }
                        Utils.openUrl(controller.episodeDetails?.urlHd);
                      },
                      label: "Download em HD")),
              RippleButton(
                  color: Theme.of(context).colorScheme.secondaryVariant,
                  onTap: () async {
                    if (controller.episodeDetails?.url == null) {
                      return;
                    }

                    try {
                      await Utils.openUrl(controller.episodeDetails?.url);
                    } catch (e) {
                      print(e);
                    }
                  },
                  label: "Download"),
            ]),
          )
        ]);
      }),
    );
  }
}
