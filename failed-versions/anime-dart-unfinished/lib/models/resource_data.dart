import 'package:flutter/material.dart';

class ResourceData {
  final String imageUrl;
  final String label;
  final String id;
  final String linkId;

  ResourceData(
      {this.imageUrl, @required this.label, @required this.id, this.linkId});
}
