import 'package:flutter/material.dart';

import 'package:anime_dart/app/core/details/domain/entities/anime_details.dart';
import 'package:anime_dart/app/core/details/domain/entities/episode_details.dart';
import 'package:anime_dart/app/modules/home/screens/anime_details/widgets/anime_details_header.dart';
import 'package:anime_dart/app/modules/home/screens/anime_details/widgets/anime_details_tile.dart';

class AnimeDetailsListWithHeader extends StatelessWidget {
  final List<EpisodeDetails> episodes;
  final AnimeDetails details;

  AnimeDetailsListWithHeader({
    Key key,
    this.episodes,
    this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(bottom: 85),
        itemBuilder: (_, i) {
          if (i == 0) {
            return AnimeDetailsHeader(details: details);
          }

          final episode = episodes[i - 1];

          return AnimeDetailsTile(episode: episode);
        },
        separatorBuilder: (_, i) =>
            Divider(color: Colors.transparent, height: i == 0 ? 20 : 10),
        itemCount: episodes.length + 1);
  }
}
