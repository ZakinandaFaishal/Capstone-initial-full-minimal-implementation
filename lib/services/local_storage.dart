import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _prefs;

  static const String _keyUsers = 'users';
  static const String _keyFavorites = 'favorites';

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

// Users stored as map email -> {username, password}
  static Future saveUser(String email, String username, String password) async {
    final usersJson = _prefs!.getString(_keyUsers);
    Map<String, dynamic> users = {};
    if (usersJson != null) users = json.decode(usersJson);
    users[email] = {'username': username, 'password': password};
    await _prefs!.setString(_keyUsers, json.encode(users));
  }

  static Map<String, dynamic>? getUser(String email) {
    final usersJson = _prefs!.getString(_keyUsers);
    if (usersJson == null) return null;
    final Map users = json.decode(usersJson);
    if (users.containsKey(email))
      return Map<String, dynamic>.from(users[email]);
    return null;
  }

  static Future saveFavorites(List<int> favorites) async {
    await _prefs!.setString(_keyFavorites, json.encode(favorites));
  }

  static List<int> getFavorites() {
    final favJson = _prefs!.getString(_keyFavorites);
    if (favJson == null) return [];
    final List data = json.decode(favJson);
    return data.map((e) => e as int).toList();
  }
}
