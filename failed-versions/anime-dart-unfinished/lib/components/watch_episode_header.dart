import 'package:anime_dart/services/anime_tv_api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WatchEpisodeHeader extends StatelessWidget {
  final String imageUrl;
  final String label;

  WatchEpisodeHeader({@required this.imageUrl, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              width: 140,
              height: 200,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      httpHeaders: AnimeTvApi.httpHeaders,
                      imageUrl: imageUrl,
                      placeholder: (context, url) => Container(
                          width: 140,
                          height: 200,
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(.30)),
                      errorWidget: (context, url, error) => Container(
                          width: 140,
                          height: 200,
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(.90))))),
          Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text("EPISÓDIO",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
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
                          child: Text(label,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .fontSize)))
                    ])),
              ]))
        ]));
  }
}
