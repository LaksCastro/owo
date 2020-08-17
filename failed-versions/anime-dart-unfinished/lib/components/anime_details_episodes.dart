import 'package:anime_dart/models/barrel.dart';
import 'package:flutter/material.dart';

import "package:anime_dart/components/anime_details_episodes_tile.dart";

class AnimeDetailsEpisodes extends StatelessWidget {
  final List<EpisodeInfo> episodes;

  AnimeDetailsEpisodes({Key key, @required this.episodes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    for (final episode in episodes) {
      items.add(AnimeDetailsEpisodesTile(
        episode: episode,
      ));
    }

    List<Widget> body = [];

    body.add(Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(children: items)));

    return Container(
      margin: EdgeInsets.only(bottom: 60),
      child: Column(
        children: body,
      ),
    );
  }
}
