import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import 'package:anime_dart/app/core/details/domain/entities/episode_details.dart';

class AnimeDetailsTile extends StatelessWidget {
  final EpisodeDetails episode;

  AnimeDetailsTile({
    Key key,
    this.episode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            border: Border(
                left: BorderSide(
                    width: 5,
                    color: Color.lerp(
                        Colors.red, Colors.green, episode.stats / 100)))),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: ListTile(
          title: Text(episode.label, style: TextStyle(height: 1.5)),
          leading: Icon(OMIcons.playArrow,
              color:
                  Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5)),
        ));
  }
}
