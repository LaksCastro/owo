import "package:dio/dio.dart";

main() async {
  final response = await Dio().get("https://img.trinets.xyz/api/v1?type=url");

  print(response.data);
}
