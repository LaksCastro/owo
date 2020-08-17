import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:anime_dart/app/modules/home/screens/favorites/widgets/list.dart';
import 'package:anime_dart/app/modules/home/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritesScreen extends StatefulWidget {
  FavoritesScreen({Key key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ModularState<FavoritesScreen, HomeStore> {
  @override
  void initState() {
    super.initState();

    controller.loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(builder: (_) {
        if (controller.loadingFavorites) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.favoritesError != null) {
          return Center(
              child: Column(
            children: [
              Text(controller.favoritesError),
              FlatButton(
                  onPressed: controller.loadFavorites,
                  child: Text("Tentar novamente"))
            ],
          ));
        }

        if (controller.emptyFavoriteList) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(30),
            child: Text(
                "Sua lista de favoritos está vazia! Adicione um clicando no botão na parte inferior direita da tela!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.5,
                )),
          );
        }

        return FavoritesList(
            linkBuilder: (Anime anime) {
              void onTap() {
                controller.setAnimeDetailsId(anime.id);

                Modular.to.pushNamed("/anime-details");
              }

              return onTap;
            },
            animes: controller.favorites,
            cardLabel: "FAVORITADOS",
            onRefresh: controller.loadFavorites);
      }),
    );
  }
}
