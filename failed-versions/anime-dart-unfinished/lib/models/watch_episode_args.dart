import 'package:flutter/material.dart';

class WatchEpisodeArgs {
  final String episodeId;
  final String label;
  final String imageUrl;
  final String animeId;

  WatchEpisodeArgs(
      {@required this.episodeId,
      @required this.label,
      @required this.imageUrl,
      @required this.animeId});
}
