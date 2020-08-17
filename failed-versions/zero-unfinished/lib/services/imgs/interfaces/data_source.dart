import 'package:zero/models/category.dart';
import 'package:zero/models/img.dart';

abstract class ExternalDataSource {
  Future<List<Img>> getRandomImgs();
  Future<List<Img>> getByCategory(List<Category> categories);
  List<Category> getCategories();
}
