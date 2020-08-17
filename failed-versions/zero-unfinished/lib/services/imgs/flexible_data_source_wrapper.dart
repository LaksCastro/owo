import 'package:flutter/material.dart';

import 'package:zero/models/category.dart';
import 'package:zero/models/img.dart';
import 'package:zero/services/imgs/interfaces/flexible_data_source.dart';

class FlexibleDataSource implements FlexibleExternalDataSource {
  final FlexibleExternalDataSource dataSource;

  FlexibleDataSource({
    @required this.dataSource,
  });

  @override
  Future<List<Img>> getByCategory(List<Category> categories) {
    return dataSource.getByCategory(categories);
  }

  @override
  List<Category> getCategories() {
    return dataSource.getCategories();
  }

  @override
  Future<List<Img>> getRandomImgs() {
    return dataSource.getRandomImgs();
  }

  @override
  Future<List<Img>> getBySearch(String text,
      [int page = 1, bool random = false]) {
    return dataSource.getBySearch(text, page, random);
  }

  @override
  Future<List<Category>> getMainCategories(int page) {
    return dataSource.getMainCategories(page);
  }

  @override
  Future<List<Img>> getLatests(int page) {
    return dataSource.getLatests(page);
  }
}
