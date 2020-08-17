import 'package:zero/models/category.dart';
import 'package:zero/models/img.dart';
import 'package:zero/services/imgs/interfaces/data_source.dart';

abstract class FlexibleExternalDataSource extends ExternalDataSource {
  Future<List<Category>> getMainCategories(int page);
  Future<List<Img>> getBySearch(String text,
      [int page = 1, bool random = false]);
  Future<List<Img>> getLatests(int page);
}
