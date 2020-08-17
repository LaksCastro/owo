import "package:dio/dio.dart";
import 'package:flutter/material.dart';
import 'package:zero/constants/utils.dart';

import 'package:zero/models/category.dart';
import 'package:zero/models/img.dart';
import 'package:zero/services/imgs/interfaces/data_source.dart';

class ScrollerDataSource implements ExternalDataSource {
  final Dio dio;

  ScrollerDataSource({
    @required this.dio,
  });

  final _endpoint = "https://scrolller.com/api/pics";
  final _imgBaseUrl = "https://disco.scrolller.com/media/";

  String _getImgUrl(String imgPath) {
    return "$_imgBaseUrl$imgPath";
  }

  @override
  Future<List<Img>> getRandomImgs() async {
    final response = await dio.post(_endpoint, data: "[[1178,2,200,50]]");

    if (response.statusCode != 200) {
      throw Exception();
    }

    final imgIds = Utils.getFlatList(response.data);

    // Remove all that is not a image URL
    imgIds.removeWhere((element) =>
        (element is! String) || (!((element as String).endsWith(".jpg"))));

    // Randomize images URL
    imgIds.shuffle();

    final imgList = imgIds.map((e) => Img(url: _getImgUrl(e))).toList();

    return imgList;
  }

  @override
  List<Category> getCategories() {
    return [];
  }

  @override
  Future<List<Img>> getByCategory(List<Category> categories) async {
    return await getRandomImgs();
  }
}
