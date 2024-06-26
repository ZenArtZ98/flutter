import 'package:shared_preferences/shared_preferences.dart';

class _SharedPreferenceServiceKey {
  static const theme = 'THEME';
}

class SharedPreferenceService {
  static Future<bool> getTheme() async {
    final pref = await SharedPreferences.getInstance();
    final isDark = pref.getBool(_SharedPreferenceServiceKey.theme);
    return isDark ?? false;
  }

  static Future<void> setTheme(bool isDark) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(_SharedPreferenceServiceKey.theme, isDark);
  }

  static Future<void> removeTheme(bool isDark) async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(_SharedPreferenceServiceKey.theme);
  }
}
