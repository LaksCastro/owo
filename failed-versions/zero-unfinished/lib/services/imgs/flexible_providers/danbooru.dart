import "package:dio/dio.dart";
import 'package:flutter/material.dart';
import 'package:zero/constants/utils.dart';
import "package:diacritic/diacritic.dart";
import 'package:zero/models/category.dart';
import 'package:zero/models/img.dart';
import 'package:zero/services/imgs/interfaces/flexible_data_source.dart';

class DanbooruDataSource implements FlexibleExternalDataSource {
  final Dio dio;

  DanbooruDataSource({
    @required this.dio,
  });

  final _baseUrl = "https://danbooru.donmai.us";

  String _normalizeTag(String text) {
    return removeDiacritics(text.toLowerCase().replaceAll(" ", "_"));
  }

  bool _isImg(String url) {
    return RegExp(r"(.jpg)$|(.png)$|(.jpeg)$|(.webp)$").allMatches(url).length >
        0;
  }

  Future<Img> _getRandomImg(String endpoint) async {
    final response = await dio.get(endpoint);

    if (response.statusCode != 200) {
      throw Exception();
    }

    final img = Img(url: response.data[0]["large_file_url"] as String);

    return img;
  }

  Future<List<Img>> _getRandomRequests(List<Category> categories) async {
    final results = <Img>[];

    for (int i = 0; i < 10; i++) {
      var response;

      try {
        response = await _getRandomImg(
            "$_baseUrl?posts.json?limit=1&tags=${categories[Utils.randomInt(0, categories.length - 1)].id}");

        results.add(response);
      } catch (e) {}
    }

    return results;
  }

  @override
  List<Category> getCategories() {
    return [
      Category(id: "breasts", label: "Breasts"),
      Category(id: "solo", label: "Solo"),
      Category(id: "paizuri", label: "Paizuri"),
      Category(id: "bra", label: "Bra"),
      Category(id: "panties", label: "Panties"),
      Category(id: "lace", label: "Lace"),
      Category(id: "lingerie", label: "Lingerie"),
    ];
  }

  @override
  Future<List<Img>> getByCategory(List<Category> categories) async {
    final imgList = [...(await _getRandomRequests(categories))];

    // Remove all that is not an image
    imgList.removeWhere((img) => !(_isImg(img.url)));

    if (imgList.length == 0) {
      throw Exception();
    }

    return imgList;
  }

  @override
  Future<List<Img>> getRandomImgs() async {
    final results = <Img>[];

    final response = await dio.get("$_baseUrl/posts.json&random=true");

    if (response.statusCode != 200) {
      throw Exception();
    }

    for (final result in response.data) {
      if (_isImg(result["large_file_url"])) {
        results.add(Img(url: result["large_file_url"]));
      }
    }

    return results;
  }

  @override
  Future<List<Img>> getBySearch(String text,
      [int page = 1, bool random = false]) async {
    text = _normalizeTag(text);

    final results = <Img>[];

    final response = await dio.get(
        "$_baseUrl/posts.json?tags=$text&${random ? "random=true" : "page=$page"}");

    if (response.statusCode != 200) {
      throw Exception();
    }

    for (final result in response.data) {
      // add to results only if is a image
      if (_isImg(result["large_file_url"])) {
        results.add(Img(url: result["large_file_url"]));
      }
    }

    return results;
  }

  @override
  Future<List<Category>> getMainCategories(int page) async {
    final response =
        await dio.get("$_baseUrl/tags.json?search[order]=count&page=$page");

    if (response.statusCode != 200) {
      throw Exception();
    }

    final categories = <Category>[];

    for (final tag in response.data) {
      final name = tag["name"] as String;

      categories.add(Category(
          id: name,
          label: (name[0].toUpperCase() + name.substring(1).toLowerCase())
              .replaceAll("_", " ")));
    }

    return categories;
  }

  @override
  Future<List<Img>> getLatests(int page) async {
    final results = <Img>[];

    final response = await dio.get("$_baseUrl/posts.json&page=$page");

    if (response.statusCode != 200) {
      throw Exception();
    }

    for (final result in response.data) {
      results.add(Img(url: result["large_file_url"]));
    }

    return results;
  }
}
