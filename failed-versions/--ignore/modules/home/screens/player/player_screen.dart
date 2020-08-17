import 'package:anime_dart/app/constants/utils.dart';
import 'package:anime_dart/app/modules/home/store/home_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:video_player/video_player.dart';

class PlayerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlayerScreenState();
  }
}

class _PlayerScreenState extends ModularState<PlayerScreen, HomeStore> {
  @override
  initState() {
    super.initState();

    if (controller.episodeUrlPlaying == null) {
      throw Exception("Is extremelly needed that the episode url is != null");
    }

    controller.initializePlayerController();
  }

  @override
  void dispose() {
    controller.destroyPlayer();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      child: Center(child: Observer(builder: (_) {
        if (!controller.playerOk) {
          return CircularProgressIndicator();
        }

        return GestureDetector(
            onTap: controller.a,
            child: AspectRatio(
              aspectRatio: controller.videoPlayerController.value.aspectRatio,
              child: VideoPlayer(controller.videoPlayerController),
            ));
      })),
    );
  }
}
