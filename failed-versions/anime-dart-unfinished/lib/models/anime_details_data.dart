import 'package:flutter/material.dart';

class AnimeDetailsData {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final String genres;
  final String year;

  AnimeDetailsData(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.description,
      @required this.genres,
      @required this.year});
}
