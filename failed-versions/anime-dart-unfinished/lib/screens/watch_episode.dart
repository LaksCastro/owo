import 'package:anime_dart/get_it.dart';
import 'package:anime_dart/models/anime_details_args.dart';
import 'package:anime_dart/screens/anime_details.dart';
import 'package:anime_dart/store/anime_details_controller.dart';
import 'package:anime_dart/store/watch_episode_controller.dart';
import 'package:flutter/material.dart';

import "package:anime_dart/models/watch_episode_args.dart";
import "package:anime_dart/components/barrel.dart";
import 'package:flutter_mobx/flutter_mobx.dart';

class WatchEpisode extends StatefulWidget {
  final WatchEpisodeArgs args;

  WatchEpisode({this.args});

  @override
  _WatchEpisodeState createState() => _WatchEpisodeState(args: args);
}

class _WatchEpisodeState extends State<WatchEpisode> {
  final WatchEpisodeArgs args;
  final watchEpisodeController = getIt<WatchEpisodeController>();
  final animeDetailsController = getIt<AnimeDetailsController>();

  _WatchEpisodeState({this.args});

  @override
  initState() {
    super.initState();

    watchEpisodeController.setEpisodeInfo(
        animeIdValue: args.animeId,
        labelValue: args.label,
        imageUrlValue: args.imageUrl,
        episodeIdValue: args.episodeId);

    watchEpisodeController.loadVideoUrl();
  }

  @override
  dispose() {
    watchEpisodeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(args.label)),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 0,
            ),
            child: IntrinsicHeight(
              child: Container(
                  margin: EdgeInsets.only(bottom: 60),
                  child: Column(
                    children: [
                      WatchEpisodeHeader(
                        imageUrl: args.imageUrl,
                        label: args.label,
                      ),
                      Observer(builder: (_) {
                        if (watchEpisodeController.loadingVideoUrl) {
                          return Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 100, horizontal: 20),
                              child: CircularProgressIndicator());
                        }

                        return WatchButtons(
                          episodeId: watchEpisodeController.episodeId,
                          videoUrlHd: watchEpisodeController.videoUrlHd,
                          videoUrl: watchEpisodeController.videoUrl,
                        );
                      })
                    ],
                  )),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (animeDetailsController.details?.id ==
                watchEpisodeController.animeId) {
              return Navigator.pop(context);
            }
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => AnimeDetails(
                        args: AnimeDetailsArgs(
                            animeId: watchEpisodeController.animeId,
                            title: watchEpisodeController.label))));
          },
          label: Text('Ver lista de episódios'),
          icon: Icon(Icons.playlist_add_check),
        ));
  }
}
