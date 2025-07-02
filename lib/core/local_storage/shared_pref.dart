import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService extends GetxController {
  late SharedPreferences _prefs;

  var intValues = <String, int>{}.obs;
  var stringValues = <String, String>{}.obs;
  var boolValues = <String, bool>{}.obs;
  var stringListValues = <String, List<String>>{}.obs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  T getValue<T>(String key, T defaultValue) {
    if (T == int) {
      if (!intValues.containsKey(key)) {
        final value = _prefs.getInt(key) ?? defaultValue as int;
        intValues[key] = value;
      }
      return intValues[key] as T;
    } else if (T == String) {
      if (!stringValues.containsKey(key)) {
        final value = _prefs.getString(key) ?? defaultValue as String;
        stringValues[key] = value;
      }
      return stringValues[key] as T;
    } else if (T == bool) {
      if (!boolValues.containsKey(key)) {
        final value = _prefs.getBool(key) ?? defaultValue as bool;
        boolValues[key] = value;
      }
      return boolValues[key] as T;
    } else {
      throw UnsupportedError('Type $T is not supported');
    }
  }

  Future<void> setValue<T>(String key, T value) async {
    if (T == int) {
      intValues[key] = value as int;
      await _prefs.setInt(key, value as int);
    } else if (T == String) {
      stringValues[key] = value as String;
      await _prefs.setString(key, value as String);
    } else if (T == bool) {
      boolValues[key] = value as bool;
      await _prefs.setBool(key, value as bool);
    } else {
      throw UnsupportedError('Type $T is not supported');
    }
  }

  List<String> getStringList(String key) {
    if (!stringListValues.containsKey(key)) {
      final value = _prefs.getStringList(key) ?? <String>[];
      stringListValues[key] = value;
    }
    return stringListValues[key]!;
  }

  Future<void> setStringList(String key, List<String> value) async {
    stringListValues[key] = value;
    await _prefs.setStringList(key, value);
  }

  Future<void> addToStringList(String key, String value) async {
    final currentList = List<String>.from(getStringList(key));
    if (!currentList.contains(value)) {
      currentList.add(value);
      await setStringList(key, currentList);
    }
  }

  bool isInStringList(String key, String value) {
    return getStringList(key).contains(value);
  }

  int getStringListCount(String key) {
    return getStringList(key).length;
  }

  Future<void> loadKeys(List<String> keys) async {
    for (String key in keys) {
      if (_prefs.containsKey(key) && _prefs.get(key) is int) {
        intValues[key] = _prefs.getInt(key)!;
      }
      if (_prefs.containsKey(key) && _prefs.get(key) is List) {
        stringListValues[key] = _prefs.getStringList(key) ?? [];
      }
    }
  }

  Future<void> resetKeys(List<String> keys) async {
    for (String key in keys) {
      await setValue<int>(key, 0);
      await setStringList(key, []);
    }
  }

  int getTotalForKeys(List<String> keys) {
    int total = 0;
    for (String key in keys) {
      total += getValue<int>(key, 0);
    }
    return total;
  }

  Future<void> incrementCounter(String key) async {
    final current = getValue<int>(key, 0);
    await setValue<int>(key, current + 1);
  }

  Future<void> resetCounter(String key) async {
    await setValue<int>(key, 0);
  }
}
