import "package:dio/dio.dart";
import 'package:flutter/material.dart';
import 'package:zero/constants/utils.dart';

import 'package:zero/models/category.dart';
import 'package:zero/models/img.dart';
import 'package:zero/services/imgs/interfaces/data_source.dart';

class LoliLifesDataSource implements ExternalDataSource {
  final Dio dio;

  LoliLifesDataSource({
    @required this.dio,
  });

  final _baseUrl = "https://api.lolis.life/random";

  String _getEndpoint(String categoryId) {
    assert(categoryId != null);

    return "$_baseUrl?category=$categoryId";
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
      Category(id: "neko", label: "Neko"),
      Category(id: "futa", label: "Futa"),
      Category(id: "kawaii", label: "Kwaii"),
      Category(id: "lewd", label: "Lewd"),
      Category(id: "slave", label: "Slave"),
      Category(id: "pat", label: "Pat"),
      Category(id: "monster", label: "Monster"),
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
