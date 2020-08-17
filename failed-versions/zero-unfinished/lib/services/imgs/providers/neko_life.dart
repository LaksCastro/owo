import "package:dio/dio.dart";
import 'package:flutter/material.dart';
import 'package:zero/constants/utils.dart';

import 'package:zero/models/category.dart';
import 'package:zero/models/img.dart';
import 'package:zero/services/imgs/interfaces/data_source.dart';

class NekoLifeDataSource implements ExternalDataSource {
  final Dio dio;

  NekoLifeDataSource({
    @required this.dio,
  });

  final _baseUrl = "https://nekos.life/api/v2";

  String _getEndpoint(String categoryId) {
    assert(categoryId != null);

    return "$_baseUrl/image/$categoryId";
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
      Category(id: "Random_hentai_gif", label: "Random hentai gif"),
      Category(id: "pussy", label: "Pussy"),
      Category(id: "nsfw_neko_gif", label: "Nsfw neko gif"),
      Category(id: "lewd", label: "Lewd"),
      Category(id: "les", label: "Les"),
      Category(id: "kuni", label: "Kuni"),
      Category(id: "cum", label: "Cum"),
      Category(id: "classic", label: "Classic"),
      Category(id: "boobs", label: "Boobs"),
      Category(id: "bj", label: "Bj"),
      Category(id: "anal", label: "Anal"),
      Category(id: "nsfw_avatar", label: "Nsfw avatar"),
      Category(id: "yuri", label: "Yuri"),
      Category(id: "trap", label: "Trap"),
      Category(id: "tits", label: "Tits"),
      Category(id: "solog", label: "Solog"),
      Category(id: "solo", label: "Solo"),
      Category(id: "pwankg", label: "Pwankg"),
      Category(id: "pussy_jpg", label: "Pussy jpg"),
      Category(id: "lewdkemo", label: "Lewdkemo"),
      Category(id: "lewdk", label: "Lewdk"),
      Category(id: "keta", label: "Keta"),
      Category(id: "hololewd", label: "Hololewd"),
      Category(id: "holoero", label: "Holoero"),
      Category(id: "hentai", label: "Hentai"),
      Category(id: "futanari", label: "Futanari"),
      Category(id: "femdom", label: "Femdom"),
      Category(id: "feetg", label: "Feetg"),
      Category(id: "erofeet", label: "Erofeet"),
      Category(id: "feet", label: "Feet"),
      Category(id: "ero", label: "Ero"),
      Category(id: "erok", label: "Erok"),
      Category(id: "erokemo", label: "Erokemo"),
      Category(id: "eron", label: "Eron"),
      Category(id: "eroyuri", label: "Eroyuri"),
      Category(id: "cum_jpg", label: "Cum jpg"),
      Category(id: "blowjob", label: "Blowjob"),
      Category(id: "spank", label: "Spank"),
      Category(id: "gasm", label: "Gasm"),
      Category(id: "tickle", label: "Tickle"),
      Category(id: "slap", label: "Slap"),
      Category(id: "poke", label: "Poke"),
      Category(id: "pat", label: "Pat"),
      Category(id: "neko", label: "Neko"),
      Category(id: "meow", label: "Meow"),
      Category(id: "lizard", label: "Lizard"),
      Category(id: "kiss", label: "Kiss"),
      Category(id: "hug", label: "Hug"),
      Category(id: "fox_girl", label: "Fox girl"),
      Category(id: "feed", label: "Feed"),
      Category(id: "cuddle", label: "Cuddle"),
      Category(id: "/why", label: "/why"),
      Category(id: "/cat", label: "/cat"),
      Category(id: "/owoify", label: "/owoify"),
      Category(id: "/8ball", label: "/8ball"),
      Category(id: "/fact", label: "/fact"),
      Category(id: "ngif", label: "Ngif"),
      Category(id: "kemonomimi", label: "Kemonomimi"),
      Category(id: "holo", label: "Holo"),
      Category(id: "smug", label: "Smug"),
      Category(id: "baka", label: "Baka"),
      Category(id: "woof", label: "Woof"),
      Category(id: "/spoiler", label: "/spoiler"),
      Category(id: "wallpaper", label: "Wallpaper"),
      Category(id: "goose", label: "Goose"),
      Category(id: "gecg", label: "Gecg"),
      Category(id: "avatar", label: "Avatar"),
      Category(id: "waifu", label: "Waifu")
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
