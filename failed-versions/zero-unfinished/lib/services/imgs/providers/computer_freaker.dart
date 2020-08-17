import "package:dio/dio.dart";
import 'package:flutter/material.dart';
import 'package:zero/constants/utils.dart';

import 'package:zero/models/category.dart';
import 'package:zero/models/img.dart';
import 'package:zero/services/imgs/interfaces/data_source.dart';

class ComputerFreakerDataSource implements ExternalDataSource {
  final Dio dio;

  ComputerFreakerDataSource({
    @required this.dio,
  });

  final _baseUrl = "https://api.computerfreaker.cf/v1";

  String _getEndpoint(String categoryId) {
    assert(categoryId != null);

    return "$_baseUrl/$categoryId";
  }

  Future<Img> _getRandomImg(String endpoint) async {
    final response = await dio.get(endpoint);

    if (response.statusCode != 200) {
      throw Exception();
    }

    final img = Img(url: response.data["url"] as String);

    return img;
  }

  Future<List<Img>> _getRandomRequests(List<Category> categories) async {
    final results = <Img>[];

    for (int i = 0; i < 10; i++) {
      var response;

      try {
        response = await _getRandomImg(_getEndpoint(
            categories[Utils.randomInt(0, categories.length - 1)].id));

        results.add(response);
      } catch (e) {}
    }

    return results;
  }

  @override
  List<Category> getCategories() {
    return [
      Category(id: "anime", label: "Anime"),
      Category(id: "baguette", label: "Baguette"),
      Category(id: "dva", label: "DVA"),
      Category(id: "hentai", label: "Hentai"),
      Category(id: "hug", label: "Hug"),
      Category(id: "trap", label: "Trap"),
      Category(id: "nsfwneko", label: "NSFW Neko"),
      Category(id: "neko", label: "Neko"),
      Category(id: "yuri", label: "Yuri"),
    ];
  }

  @override
  Future<List<Img>> getByCategory(List<Category> categories) async {
    final imgList = await _getRandomRequests(categories);

    if (imgList.length == 0) {
      throw Exception();
    }

    return imgList;
  }

  @override
  Future<List<Img>> getRandomImgs() async {
    final categories = getCategories();

    final imgList = await _getRandomRequests(categories);

    if (imgList.length == 0) {
      throw Exception();
    }

    return imgList;
  }
}
