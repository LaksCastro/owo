import "dart:async";
import "dart:convert";

import 'package:http/http.dart' as http;

import "../models/anime.dart";
import "../utils/main.dart";

class Jikan {
  static final String baseURL = "https://api.jikan.moe/v3";

  int tryCount = 0;

  Future<Anime> getRandomAnime() async {
    if (tryCount >= 10) {
      tryCount = 0;
      throw Exception("Unknown Error, cannot fetch a random anime");
    }

    try {
      tryCount++;

      List<String> seasons = ["summer", "spring", "fall", "winter"];

      int finalYear = DateTime.now().year;
      int initialYear = finalYear - 15;

      String year = Utils.randomInt(initialYear, finalYear).toString();
      String season = seasons[Utils.randomInt(0, seasons.length - 1)];

      String endpoint = "${Jikan.baseURL}/season/$year/$season";

      dynamic response = await http.get(endpoint);

      if (response.statusCode != 200) {
        throw Exception("Failed to fetch random anime");
      }

      dynamic data = json.decode(response.body)["anime"];

      dynamic random = data[Utils.randomInt(0, data.length - 1)];

      Anime anime = Anime(
          title: random["title"],
          synopsis: random["synopsis"],
          id: random["id"],
          imgURL: random["image_url"],
          url: random["url"]);

      tryCount = 0;

      return anime;
    } catch (e) {
      print(e.toString());
      return this.getRandomAnime();
    }
  }
}
