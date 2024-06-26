import 'package:flutter/cupertino.dart';
import 'package:my_first_app/domain/services/shared_preference_service.dart';

class SettingsService extends ChangeNotifier {
  bool _isDark = false;

  SettingsService() {
    _setThemeFromCash();
  }

  bool get isDark => _isDark;

  void _setThemeFromCash() async {
    _isDark = await SharedPreferenceService.getTheme();
    notifyListeners();
  }

  void switchTheme() async {
    _isDark = !_isDark;
    SharedPreferenceService.setTheme(_isDark);
    notifyListeners();
  }
}
