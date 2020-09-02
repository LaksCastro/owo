import 'package:flutter_starter_kit/src/models/user_data.dart';

class ProfileProvider {
  String username = "";
  UserData user;

  void setUser(UserData newUser) {
    user = newUser;
  }
}
