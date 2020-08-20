import 'package:dotenv/dotenv.dart' show env, load;

class BotConfig {
  static String DISCORD_TOKEN;
  static String DISCORD_CLIENT_ID;
  static String COMMAND_PREFIX = "taiga";

  static void define() {
    load();

    DISCORD_TOKEN = env['DISCORD_TOKEN'];
    DISCORD_CLIENT_ID = env['DISCORD_CLIENT_ID'];
  }
}
