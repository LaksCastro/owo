import 'package:anime_dart/models/barrel.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class AnimeDetailsEpisodesTile extends StatelessWidget {
  final EpisodeInfo episode;

  AnimeDetailsEpisodesTile({Key key, this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: episode.link));
          },
          title: Text(episode.label, style: TextStyle(height: 1.5)),
          leading: Icon(OMIcons.playArrow,
              color:
                  Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5)),
        ));
  }
}
