import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService extends GetxController {
  static SharedPrefsService get instance {
    if (!Get.isRegistered<SharedPrefsService>()) {
      Get.put(SharedPrefsService._internal());
    }
    return Get.find<SharedPrefsService>();
  }

  SharedPrefsService._internal();

  SharedPreferences? _prefs;
  bool _isInitialized = false;

  // Generic observable map to track any key-value pairs
  var counters = <String, int>{}.obs;

  /// Initialize SharedPreferences only when needed
  Future<void> _ensureInitialized() async {
    if (_isInitialized && _prefs != null) return;

    try {
      _prefs = await SharedPreferences.getInstance();
      _isInitialized = true;
    } catch (e) {
      print('Error initializing SharedPreferences: $e');
    }
  }

  /// Load a specific counter by key
  Future<void> loadCounter(String key) async {
    await _ensureInitialized();
    if (_prefs == null) return;

    final count = _prefs!.getInt(key) ?? 0;
    counters[key] = count;
  }

  /// Load multiple counters by keys
  Future<void> loadCounters(List<String> keys) async {
    await _ensureInitialized();
    if (_prefs == null) return;

    for (String key in keys) {
      final count = _prefs!.getInt(key) ?? 0;
      counters[key] = count;
    }
  }

  /// Increment counter for a specific key
  Future<void> incrementCounter(String key) async {
    await _ensureInitialized();
    if (_prefs == null) return;

    final currentCount = counters[key] ?? 0;
    final newCount = currentCount + 1;

    // Update observable map
    counters[key] = newCount;

    // Save to SharedPreferences
    await _prefs!.setInt(key, newCount);

    print('Counter for $key: $newCount');
  }

  /// Get counter value for a specific key
  Future<int> getCounter(String key) async {
    await _ensureInitialized();
    if (!counters.containsKey(key)) {
      await loadCounter(key);
    }
    return counters[key] ?? 0;
  }

  /// Get counter value synchronously (use after ensuring the key is loaded)
  int getCounterSync(String key) {
    return counters[key] ?? 0;
  }

  /// Reset counter for a specific key
  Future<void> resetCounter(String key) async {
    await _ensureInitialized();
    if (_prefs == null) return;

    counters[key] = 0;
    await _prefs!.setInt(key, 0);
  }

  /// Reset multiple counters
  Future<void> resetCounters(List<String> keys) async {
    await _ensureInitialized();
    if (_prefs == null) return;

    for (String key in keys) {
      counters[key] = 0;
      await _prefs!.setInt(key, 0);
    }
  }

  /// Get total count for a list of keys
  Future<int> getTotalCount(List<String> keys) async {
    await _ensureInitialized();
    await loadCounters(keys);

    int total = 0;
    for (String key in keys) {
      total += counters[key] ?? 0;
    }
    return total;
  }

  /// Generic method to save any int value
  Future<void> saveInt(String key, int value) async {
    await _ensureInitialized();
    if (_prefs == null) return;

    counters[key] = value;
    await _prefs!.setInt(key, value);
  }

  /// Generic method to get any int value
  Future<int> getInt(String key, {int defaultValue = 0}) async {
    await _ensureInitialized();
    if (_prefs == null) return defaultValue;

    final value = _prefs!.getInt(key) ?? defaultValue;
    counters[key] = value;
    return value;
  }

  /// Generic method to save any string value
  Future<void> saveString(String key, String value) async {
    await _ensureInitialized();
    if (_prefs == null) return;

    await _prefs!.setString(key, value);
  }

  /// Generic method to get any string value
  Future<String?> getString(String key) async {
    await _ensureInitialized();
    if (_prefs == null) return null;

    return _prefs!.getString(key);
  }

  /// Generic method to save any bool value
  Future<void> saveBool(String key, bool value) async {
    await _ensureInitialized();
    if (_prefs == null) return;

    await _prefs!.setBool(key, value);
  }

  /// Generic method to get any bool value
  Future<bool> getBool(String key, {bool defaultValue = false}) async {
    await _ensureInitialized();
    if (_prefs == null) return defaultValue;

    return _prefs!.getBool(key) ?? defaultValue;
  }

  /// Check if service is initialized
  bool get isInitialized => _isInitialized;
}
