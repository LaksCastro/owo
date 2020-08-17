import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zero/models/prefs.dart';

class PrefsDataSource {
  SharedPreferences _prefs;
  final _key = "app_zero_shared_preferences_id";

  Future<SharedPreferences> _getPrefs() async {
    if (_prefs != null) {
      return _prefs;
    }

    _prefs = await SharedPreferences.getInstance();

    return _prefs;
  }

  Future<void> setPreferences(UserPreferences newPreferences) async {
    final prefs = await _getPrefs();

    prefs.setString(_key, json.encode(newPreferences));
  }

  Future<UserPreferences> getPreferences() async {
    final prefs = await _getPrefs();

    final value = prefs.getString(_key);

    if (value == null) {
      await setPreferences(UserPreferences());

      return await getPreferences();
    }

    return UserPreferences.fromJson(value);
  }
}
