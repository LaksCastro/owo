import "package:anime_dart/models/video_data.dart";
import 'package:flutter/material.dart';

class VideoResource extends VideoData {
  VideoResource(
      {String urlHd, @required String url, @required String episodeId})
      : super(urlHd: urlHd, url: url, episodeId: episodeId);
}
