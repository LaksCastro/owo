import 'package:anime_dart/components/resource_tile.dart';

import 'package:flutter/material.dart';

import 'package:anime_dart/models/resource.dart';

class ResourceList extends StatelessWidget {
  final List<Resource> resources;
  final String cardLabel;
  final Future<void> Function() onRefresh;

  ResourceList(
      {@required this.resources,
      @required this.cardLabel,
      @required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: Theme.of(context).colorScheme.secondary,
        onRefresh: this.onRefresh,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            itemCount: resources.length,
            itemBuilder: (BuildContext context, int index) {
              final resource = resources[index];
              final isLast = index == resources.length - 1;

              return ResourceTile(
                  resource: resource, isLast: isLast, cardLabel: cardLabel);
            }));
  }
}
