import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:anime_dart/app/modules/home/screens/trending/widgets/tile.dart';
import 'package:flutter/material.dart';

class RandomList extends StatelessWidget {
  final List<Anime> animes;
  final String cardLabel;
  final Future<void> Function() onRefresh;
  final ScrollController scrollController;
  final void Function() Function(Anime anime) linkBuilder;

  RandomList(
      {@required this.animes,
      @required this.cardLabel,
      @required this.onRefresh,
      @required this.linkBuilder,
      this.scrollController});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: Theme.of(context).colorScheme.secondary,
        onRefresh: this.onRefresh,
        child: ListView.separated(
            controller: scrollController,
            separatorBuilder: (_, __) =>
                Divider(color: Colors.transparent, height: 10),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            itemCount: animes.length,
            itemBuilder: (BuildContext context, int index) {
              final anime = animes[index];

              return TrendingTile(
                  anime: anime,
                  cardLabel: cardLabel,
                  onTap: linkBuilder(anime));
            }));
  }
}
