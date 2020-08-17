import 'package:flutter/material.dart';

import "package:anime_dart/models/resource_data.dart";

class Resource extends ResourceData {
  final Widget Function(BuildContext) link;

  Resource(
      {String imageUrl,
      @required String label,
      @required String id,
      String linkId,
      @required this.link})
      : super(imageUrl: imageUrl, label: label, id: id, linkId: linkId);
}
