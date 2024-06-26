import 'package:flutter/material.dart';
import 'package:my_first_app/domain/di/locator.dart';
import 'package:my_first_app/ui/route.dart';
import 'package:my_first_app/ui/screens/heroes/heroes_screen.dart';
import 'package:provider/provider.dart';
import 'package:my_first_app/domain/services/settings_service.dart';
import 'package:my_first_app/ui/resources/themes/dark_theme.dart';
import 'package:my_first_app/ui/resources/themes/light_theme.dart';

void main() {
  final locator = LocatorService();
  runApp(MyApp(locator: locator));
}

class MyApp extends StatelessWidget {
  final LocatorService locator;

  const MyApp({
    super.key,
    required this.locator,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsService>(
      create: (BuildContext context) => SettingsService(),
      builder: (context, child) {
        final isDark = Provider.of<SettingsService>(context).isDark;

        return MaterialApp(
          theme: isDark ? darkThemeData : lightThemeData,
          navigatorKey: locator.navigatorKey,
          home: const HeroesScreen(),
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}
