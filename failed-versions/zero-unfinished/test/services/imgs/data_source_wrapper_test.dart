import 'package:dio/dio.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:mockito/mockito.dart';
import 'package:zero/models/category.dart';
import 'package:zero/models/img.dart';
import 'package:zero/services/imgs/data_source_wrapper.dart';
import 'package:zero/services/imgs/providers.dart';
import 'package:zero/services/imgs/flexible_providers.dart';
import 'package:string_validator/string_validator.dart' show isURL;

class MockDio extends Mock implements Dio {}

final notFlatArray = [
  [
    1178,
    "hentai",
    2,
    [
      [
        576777,
        "3pujim/getting_a_mouthful/",
        1,
        [
          [
            1585908,
            [
              [
                [0, "bf45c.jpg"],
                0
              ]
            ]
          ]
        ]
      ]
    ]
  ]
];

void main() {
  Map<String, Response> getResponses(final value) {
    if (value is TritiumDataSource) {
      return {
        "happy-getRandomImgs": Response(
            statusCode: 200, data: ["abc", "cde", "fgh", "ijk", "lmn"]),
        "happy-getByCategory": Response(statusCode: 200, data: "abcde"),
        "bad-getRandomImgs": Response(statusCode: 404, data: "Not Found"),
        "bad-getByCategory":
            Response(statusCode: 500, data: "Internal Server Error"),
      };
    }

    if (value is NekoBotDataSource) {
      return {
        "happy-getRandomImgs":
            Response(statusCode: 200, data: {"message": "https://abcdef.com"}),
        "happy-getByCategory":
            Response(statusCode: 200, data: {"message": "https://abcdef.com"}),
        "bad-getRandomImgs": Response(statusCode: 404, data: "Not Found"),
        "bad-getByCategory":
            Response(statusCode: 500, data: "Internal Server Error"),
      };
    }

    if (value is NekoLifeDataSource) {
      return {
        "happy-getRandomImgs":
            Response(statusCode: 200, data: {"url": "https://abcdef.com"}),
        "happy-getByCategory":
            Response(statusCode: 200, data: {"url": "https://abcdef.com"}),
        "bad-getRandomImgs": Response(statusCode: 404, data: "Not Found"),
        "bad-getByCategory":
            Response(statusCode: 500, data: "Internal Server Error"),
      };
    }

    if (value is ComputerFreakerDataSource) {
      return {
        "happy-getRandomImgs":
            Response(statusCode: 200, data: {"url": "https://abcdef.com"}),
        "happy-getByCategory":
            Response(statusCode: 200, data: {"url": "https://abcdef.com"}),
        "bad-getRandomImgs": Response(statusCode: 404, data: "Not Found"),
        "bad-getByCategory":
            Response(statusCode: 500, data: "Internal Server Error"),
      };
    }

    if (value is ScrollerDataSource) {
      return {
        "happy-getRandomImgs": Response(statusCode: 200, data: notFlatArray),
        "happy-getByCategory": Response(statusCode: 200, data: notFlatArray),
        "bad-getRandomImgs": Response(statusCode: 404, data: "Not Found"),
        "bad-getByCategory":
            Response(statusCode: 500, data: "Internal Server Error"),
      };
    }

    if (value is LoliLifesDataSource) {
      return {
        "happy-getRandomImgs":
            Response(statusCode: 200, data: {"url": "https://abcdef.com"}),
        "happy-getByCategory":
            Response(statusCode: 200, data: {"url": "https://abcdef.com"}),
        "bad-getRandomImgs": Response(statusCode: 404, data: "Not Found"),
        "bad-getByCategory":
            Response(statusCode: 500, data: "Internal Server Error"),
      };
    }

    if (value is DanbooruDataSource) {
      return {
        "happy-getRandomImgs": Response(statusCode: 200, data: [
          {"large_file_url": "https://abcdef.com/image.jpeg"}
        ]),
        "happy-getByCategory": Response(statusCode: 200, data: [
          {"large_file_url": "https://abcdef.com/image.jpeg"}
        ]),
        "bad-getRandomImgs": Response(statusCode: 404, data: "Not Found"),
        "bad-getByCategory":
            Response(statusCode: 500, data: "Internal Server Error"),
      };
    }

    throw Exception("Invalid value");
  }

  final dataSources = [
    (dio) => TritiumDataSource(dio: dio),
    (dio) => NekoBotDataSource(dio: dio),
    (dio) => NekoLifeDataSource(dio: dio),
    (dio) => ComputerFreakerDataSource(dio: dio),
    (dio) => ScrollerDataSource(dio: dio),
    (dio) => LoliLifesDataSource(dio: dio),
    (dio) => DanbooruDataSource(dio: dio)
  ];

  for (final currentDataSource in dataSources) {
    final dioMock = MockDio();
    final providerInstance = currentDataSource(dioMock);
    final dataSource = DataSource(dataSource: providerInstance);
    final responses = getResponses(providerInstance);

    group("happy way", () {
      test(".getRandomImgs() must be a List<Img>", () async {
        when(dioMock.get(any))
            .thenAnswer((_) async => responses["happy-getRandomImgs"]);
        when(dioMock.post(any, data: anyNamed("data")))
            .thenAnswer((_) async => responses["happy-getRandomImgs"]);

        final imgs = await dataSource.getRandomImgs();

        expect(imgs is List<Img>, true);
        expect(imgs.every((element) => (isURL(element.url))), true);
        expect(imgs.every((element) => (element is Img)), true);
      });

      test(".getCategories() must be a List<Category>", () {
        final categories = dataSource.getCategories();

        expect(categories is List<Category>, true);
      });

      test(".getByCategory() must be a List<Img>", () async {
        final categories = dataSource.getCategories();

        when(dioMock.get(any))
            .thenAnswer((_) async => responses["happy-getByCategory"]);
        when(dioMock.post(any, data: anyNamed("data")))
            .thenAnswer((_) async => responses["happy-getByCategory"]);

        final imgs = await dataSource.getByCategory(categories);

        expect(imgs is List<Img>, true);
        expect(imgs.every((element) => (isURL(element.url))), true);
        expect(imgs.every((element) => (element is Img)), true);
      });
    });

    group("bad way", () {
      test(".getRandomImgs() must be a Exception", () {
        when(dioMock.get(any))
            .thenAnswer((_) async => responses["bad-getRandomImgs"]);
        when(dioMock.post(any, data: anyNamed("data")))
            .thenAnswer((_) async => responses["bad-getRandomImgs"]);

        expect(() async => (await dataSource.getRandomImgs()), throwsException);
      });

      test(".getByCategory() must be a Exception", () async {
        final categories = dataSource.getCategories();

        when(dioMock.get(any))
            .thenAnswer((_) async => responses["bad-getByCategory"]);
        when(dioMock.post(any, data: anyNamed("data")))
            .thenAnswer((_) async => responses["bad-getByCategory"]);

        expect(() async => (await dataSource.getByCategory(categories)),
            throwsException);
      });
    });
  }
}
