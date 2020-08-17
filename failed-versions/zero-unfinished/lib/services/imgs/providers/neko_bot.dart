import "package:dio/dio.dart";
import 'package:flutter/material.dart';
import 'package:zero/constants/utils.dart';

import 'package:zero/models/category.dart';
import 'package:zero/models/img.dart';
import 'package:zero/services/imgs/interfaces/data_source.dart';

class NekoBotDataSource implements ExternalDataSource {
  final Dio dio;

  NekoBotDataSource({
    @required this.dio,
  });

  final _baseUrl = "https://nekobot.xyz/api";

  String _getEndpoint(String categoryId) {
    assert(categoryId != null);

    return "$_baseUrl/image?type=$categoryId";
  }

  Future<Img> _getRandomImg(String endpoint) async {
    final response = await dio.get(endpoint);

    if (response.statusCode != 200) {
      throw Exception();
    }

    final img = Img(url: response.data["message"] as String);

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
      Category(id: "hass", label: "Hass"),
      Category(id: "hmidriff", label: "Hmidriff"),
      Category(id: "pgif", label: "Pgif"),
      Category(id: "4k", label: "4k"),
      Category(id: "hentai", label: "Hentai"),
      Category(id: "holo", label: "Holo"),
      Category(id: "hneko", label: "Hneko"),
      Category(id: "neko", label: "Neko"),
      Category(id: "hkitsune", label: "Hkitsune"),
      Category(id: "kemonomimi", label: "Kemonomimi"),
      Category(id: "anal", label: "Anal"),
      Category(id: "hanal", label: "Hanal"),
      Category(id: "gonewild", label: "Gonewild"),
      Category(id: "kanna", label: "Kanna"),
      Category(id: "ass", label: "Ass"),
      Category(id: "pussy", label: "Pussy"),
      Category(id: "thigh", label: "Thigh"),
      Category(id: "hthigh", label: "Hthigh"),
      Category(id: "gah", label: "Gah"),
      Category(id: "coffee", label: "Coffee"),
      Category(id: "food", label: "Food"),
      Category(id: "paizuri", label: "Paizuri"),
      Category(id: "tentacle", label: "Tentacle"),
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
