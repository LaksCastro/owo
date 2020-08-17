import 'package:dio/dio.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:mockito/mockito.dart';
import 'package:zero/models/category.dart';
import 'package:zero/models/img.dart';
import 'package:zero/services/imgs/flexible_data_source_wrapper.dart';
import 'package:zero/services/imgs/flexible_providers.dart';
import 'package:string_validator/string_validator.dart' show isURL;

class MockDio extends Mock implements Dio {}

void main() {
  Map<String, Response> getResponses(final value) {
    if (value is DanbooruDataSource) {
      return {
        "happy-getMainCategories": Response(statusCode: 200, data: [
          {"name": "abc/image.jpeg"},
          {"name": "def/image.jpeg"},
          {"name": "ghi/image.jpeg"},
        ]),
        "happy-getLatests": Response(statusCode: 200, data: [
          {"large_file_url": "https://abcdef.com/image.jpeg"}
        ]),
        "happy-getBySearch": Response(statusCode: 200, data: [
          {"large_file_url": "https://abcdef.com/image.jpeg"}
        ]),
        "bad-getMainCategories":
            Response(statusCode: 500, data: "Internal server error"),
        "bad-getLatests": Response(statusCode: 500, data: "Server Error"),
        "bad-getBySearch": Response(statusCode: 404, data: "Not Found"),
      };
    }

    throw Exception("Invalid value");
  }

  final dataSources = [(dio) => DanbooruDataSource(dio: dio)];

  for (final currentDataSource in dataSources) {
    final dioMock = MockDio();
    final providerInstance = currentDataSource(dioMock);
    final dataSource = FlexibleDataSource(dataSource: providerInstance);
    final responses = getResponses(providerInstance);

    group("happy way", () {
      test(".getMainCategories() must be a List<Category>", () async {
        when(dioMock.get(any))
            .thenAnswer((_) async => responses["happy-getMainCategories"]);

        final categories = await dataSource.getMainCategories(1);

        expect(categories is List<Category>, true);
      });

      test(".getLatests() must be a List<Img>", () async {
        when(dioMock.get(any))
            .thenAnswer((_) async => responses["happy-getLatests"]);

        final imgs = await dataSource.getLatests(1);

        expect(imgs is List<Img>, true);
        expect(imgs.every((element) => (isURL(element.url))), true);
        expect(imgs.every((element) => (element is Img)), true);
      });

      test(".getBySearch() must be a List<Category>", () async {
        when(dioMock.get(any))
            .thenAnswer((_) async => responses["happy-getBySearch"]);

        final imgs = await dataSource.getBySearch("any tag search");

        expect(imgs is List<Img>, true);
        expect(imgs.every((element) => (isURL(element.url))), true);
        expect(imgs.every((element) => (element is Img)), true);
      });
    });

    group("bad way", () {
      test(".getMainCategories() must be a Exception", () {
        when(dioMock.get(any))
            .thenAnswer((_) async => responses["bad-getMainCategories"]);

        expect(() async => (await dataSource.getMainCategories(1)),
            throwsException);
      });

      test(".getLatests() must be a Exception", () {
        when(dioMock.get(any))
            .thenAnswer((_) async => responses["bad-getLatests"]);

        expect(() async => (await dataSource.getLatests(1)), throwsException);
      });

      test(".getBySearch() must be a Exception", () {
        when(dioMock.get(any))
            .thenAnswer((_) async => responses["bad-getBySearch"]);

        expect(() async => (await dataSource.getBySearch("any tag search")),
            throwsException);
      });
    });
  }
}
