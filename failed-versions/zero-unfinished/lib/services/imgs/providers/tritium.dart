import "package:dio/dio.dart";
import 'package:flutter/material.dart';
import 'package:zero/constants/utils.dart';

import 'package:zero/models/category.dart';
import 'package:zero/models/img.dart';
import 'package:zero/services/imgs/interfaces/data_source.dart';

enum _QueriesKey { getAll, getManyByCategory }

class TritiumDataSource implements ExternalDataSource {
  final Dio dio;

  TritiumDataSource({
    @required this.dio,
  });

  final _imgBaseUrl = "https://img.trinets.xyz";
  final _baseUrl = "https://img.trinets.xyz/api/v1";

  String _getEndpoint(_QueriesKey key, [String categoryId]) {
    assert(key == _QueriesKey.getManyByCategory
        ? (categoryId != null)
        : (categoryId == null));

    if (key == _QueriesKey.getAll) {
      return "$_baseUrl?type=list";
    }
    if (key == _QueriesKey.getManyByCategory) {
      return "$_baseUrl?target=$categoryId&type=url";
    }

    throw Exception("Invalid _QueriesKey in TritiumDataSource._getEndpoint()");
  }

  String _getImgUrl(String imgPath) {
    return "$_imgBaseUrl$imgPath";
  }

  Future<Img> _getRandomImg(String endpoint) async {
    final response = await dio.get(endpoint);

    if (response.statusCode != 200) {
      throw Exception();
    }

    final img = Img(url: _getImgUrl(response.data.toString()));

    return img;
  }

  List<Img> _randomizeResponse(List<dynamic> imgIds) {
    List<Img> imgs = imgIds.map((e) => Img(url: _getImgUrl(e))).toList();

    imgs.shuffle();

    assert(imgs is List<Img> &&
        imgs.length == imgIds.length &&
        imgs.every((element) => element != null));

    return imgs;
  }

  @override
  List<Category> getCategories() {
    return [
      Category(id: "neko", label: "Neko"),
      Category(id: "neko-r19", label: "Neko-R19"),
      Category(id: "hentai", label: "Hentai"),
      Category(id: "hentai-gif", label: "Hentai GIF"),
    ];
  }

  @override
  Future<List<Img>> getByCategory(List<Category> categories) async {
    final requests = <Future<Img>>[];

    for (int i = 0; i < 10; i++) {
      var futureResponse;

      try {
        futureResponse = _getRandomImg(_getEndpoint(
            _QueriesKey.getManyByCategory,
            categories[Utils.randomInt(0, categories.length - 1)].id));

        requests.add(futureResponse);
      } catch (e) {}
    }

    final imgList = await Future.wait(requests);

    if (imgList.length == 0) {
      throw Exception();
    }

    return imgList;
  }

  @override
  Future<List<Img>> getRandomImgs() async {
    final response = await dio.get(_getEndpoint(_QueriesKey.getAll));

    if (response.statusCode != 200) {
      throw Exception();
    }

    List<dynamic> imgIds = response.data;

    List<Img> imgList = _randomizeResponse(imgIds);

    return imgList;
  }
}
