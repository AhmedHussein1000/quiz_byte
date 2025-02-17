import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData<T>({
    required String key,
    required T value,
  }) async {
    if (_prefs == null) await init();

    switch (T) {
      case const (String):
        return _prefs!.setString(key, value as String);
      case const (int):
        return _prefs!.setInt(key, value as int);
      case const (bool):
        return _prefs!.setBool(key, value as bool);
      case const (double):
        return _prefs!.setDouble(key, value as double);
      case const (List<String>):
        return _prefs!.setStringList(key, value as List<String>);
      default:
        throw Exception('Unsupported type: $T');
    }
  }

  static T? getData<T>({required String key}) {
    if (_prefs == null) throw Exception('SharedPreferences not initialized');

    switch (T) {
      case const (String):
        return _prefs!.getString(key) as T?;
      case const (int):
        return _prefs!.getInt(key) as T?;
      case const (bool):
        return _prefs!.getBool(key) as T?;
      case const (double):
        return _prefs!.getDouble(key) as T?;
      case const (List<String>):
        return _prefs!.getStringList(key) as T?;
      default:
        throw Exception('Unsupported type: $T');
    }
  }

  static Future<bool> removeData(String key) async {
    if (_prefs == null) await init();
    return _prefs!.remove(key);
  }
}