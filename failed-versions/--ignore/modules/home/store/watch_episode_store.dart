import 'package:anime_dart/app/core/details/domain/entities/episode_details.dart';
import 'package:anime_dart/app/core/details/domain/repository/details_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
part 'watch_episode_store.g.dart';

class WatchEpisodeStore = _WatchEpisodeStoreBase with _$WatchEpisodeStore;

abstract class _WatchEpisodeStoreBase with Store {}
