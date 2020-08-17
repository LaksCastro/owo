import 'package:flutter/material.dart';

import 'package:zero/models/category.dart';
import 'package:zero/models/img.dart';
import 'package:zero/services/imgs/interfaces/data_source.dart';

class DataSource implements ExternalDataSource {
  final ExternalDataSource dataSource;

  DataSource({
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
}
