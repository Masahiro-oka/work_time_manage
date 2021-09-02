import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class ShardPrefsStorage {
  const ShardPrefsStorage._();

  static const ShardPrefsStorage instance = ShardPrefsStorage._();

  factory ShardPrefsStorage() => instance;

  static SharedPreferences? _prefs;

  Future<SharedPreferences> get prefs async {
    return _prefs = await initializePrefs();
  }

  Future<SharedPreferences> initializePrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }
}
