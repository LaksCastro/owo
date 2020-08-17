import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:anime_dart/app/core/details/domain/entities/anime_details.dart';

class AnimeDetailsHeader extends StatelessWidget {
  final AnimeDetails details;

  AnimeDetailsHeader({
    Key key,
    this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> genresWidgets = [];

    for (final genre in details.genres) {
      genresWidgets.add(Container(
          margin: EdgeInsets.only(right: 5, bottom: 5),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.all(5),
          child: Text(genre,
              style: TextStyle(color: Colors.white, fontSize: 12))));
    }

    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            border: Border(
                left: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    style: BorderStyle.solid,
                    width: 5))),
        child: Column(children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                width: 140,
                height: 200,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        httpHeaders: details.imageHttpHeaders,
                        imageUrl: details.imageUrl,
                        placeholder: (context, url) => Container(
                            width: 140,
                            height: 200,
                            color: Colors.purple.withOpacity(.10)),
                        errorWidget: (context, url, error) => Container(
                            width: 140,
                            height: 200,
                            color: Colors.black.withOpacity(.60))))),
            Flexible(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 30, left: 10, right: 10),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(details.year,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ),
                            Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.05),
                                    border: Border(
                                        left: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            style: BorderStyle.solid,
                                            width: 2))),
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 20, left: 10, right: 10),
                                child: Text(details.title,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .fontSize)))
                          ])),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Wrap(children: genresWidgets)),
                ]))
          ]),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(details.synopsis, style: TextStyle(height: 2))),
        ]));
  }
}
