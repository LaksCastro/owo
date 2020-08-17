import 'package:get_it/get_it.dart';

import "package:anime_dart/store/barrel.dart";

import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<LatestController>(LatestController());
  getIt.registerSingleton<WatchEpisodeController>(WatchEpisodeController());
  getIt.registerSingleton<SearchController>(SearchController());
  getIt.registerSingleton<AnimeDetailsController>(AnimeDetailsController());
  getIt.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
}
