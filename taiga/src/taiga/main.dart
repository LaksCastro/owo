import 'dart:async';

import 'package:nyxx/Vm.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx/commands.dart';

import "../config/bot.dart";
import "../services/jikan.dart";
import "../models/anime.dart";

class Service {
  String data;

  Service(this.data);
}

class Taiga {
  constructor() {}

  Future<void> start() async {
    configureNyxxForVM();

    String token = BotConfig.DISCORD_TOKEN;

    print("token: $token");

    Nyxx bot = Nyxx(token);

    CommandsFramework(bot,
        prefix: BotConfig.COMMAND_PREFIX,
        admins: [Snowflake("398327103990398976")])
      ..discoverCommands();

    bot.onReady.first.then((event) => print("q q tacoseteno jsus"));
  }
}

@Command("anime", typing: true)
Future<void> randomAnime(CommandContext context) async {
  Jikan jikan = Jikan();

  Anime anime = await jikan.getRandomAnime();

  EmbedBuilder embed = EmbedBuilder();

  embed.color = DiscordColor.green;
  embed.title = anime.title;
  embed.description = anime.synopsis;
  embed.imageUrl = anime.imgURL;
  embed.url = anime.url;

  context.reply(embed: embed);
}
