import 'package:anime_dart/app/core/details/domain/entities/episode_details.dart';
import 'package:anime_dart/app/modules/home/screens/anime_details/widgets/anime_details_tile.dart';
import 'package:flutter/material.dart';

class AnimeDetailsList extends StatelessWidget {
  final List<EpisodeDetails> episodes;

  AnimeDetailsList({Key key, @required this.episodes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(bottom: 85),
        itemBuilder: (_, i) {
          final episode = episodes[i];

          return AnimeDetailsTile(episode: episode);
        },
        separatorBuilder: (_, __) =>
            Divider(color: Colors.transparent, height: 10),
        itemCount: episodes.length);
  }
}
