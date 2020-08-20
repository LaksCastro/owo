import "dart:math";

class Utils {
  static final Random random = Random();

  static String getIdFromMessage(String message) {
    return message.substring(2, message.length - 1);
  }

  static int randomInt(min, max) {
    int randomInt = min + random.nextInt(max - min);

    return randomInt;
  }
}
