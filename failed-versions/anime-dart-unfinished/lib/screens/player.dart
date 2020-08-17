import 'package:anime_dart/get_it.dart';
import 'package:anime_dart/store/anime_details_controller.dart';
import 'package:anime_dart/services/shared_preferences.dart';
import 'package:anime_dart/utils/main.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class Player extends StatefulWidget {
  final String url;
  final String episodeId;

  Player({@required this.url, @required this.episodeId});

  @override
  State<StatefulWidget> createState() {
    return _PlayerState(url: url, episodeId: episodeId);
  }
}

class _PlayerState extends State<Player> {
  final String url;
  final String episodeId;

  final _animeDetailsController = getIt<AnimeDetailsController>();
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  final _sharedPreferencesInstance = SharedPreferencesInstance();
  double Function(double) _getProgress;
  double _progress;

  _PlayerState({@required this.url, @required this.episodeId});

  _videoPlayerListener() {
    _progress = _getProgress(
        _videoPlayerController.value.position.inSeconds.toDouble());

    _sharedPreferencesInstance.setEpisodeProgress(episodeId, _progress);
  }

  initializePlayerController() async {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    await _videoPlayerController.initialize();
    await _videoPlayerController.play();

    _getProgress = Utils.interpolate(
        xInterval: [0, _videoPlayerController.value.duration.inSeconds * 0.8],
        yInterval: [0, 100]);

    _videoPlayerController.addListener(_videoPlayerListener);

    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        aspectRatio: _videoPlayerController.value.aspectRatio,
        allowedScreenSleep: false,
        allowFullScreen: true,
        fullScreenByDefault: true,
        placeholder: Container(
          color: Colors.black,
        ),
        autoInitialize: true,
      );
    });
  }

  @override
  initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.network(url);

    initializePlayerController();
  }

  @override
  dispose() {
    _animeDetailsController?.updateProgressOnEpisode(episodeId, _progress);

    _videoPlayerController?.dispose();
    _chewieController?.dispose();

    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.bottom, SystemUiOverlay.top]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        child: (_chewieController == null)
            ? Center(child: CircularProgressIndicator())
            : (Container(
                child: Column(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Chewie(
                        controller: _chewieController,
                      ),
                    ),
                  ),
                ],
              ))));
  }
}
