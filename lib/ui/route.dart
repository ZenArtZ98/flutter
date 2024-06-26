import 'package:flutter/material.dart';
import 'package:my_first_app/data/model/hero.dart';
import 'package:my_first_app/data/model/minion.dart';
import 'package:my_first_app/ui/screens/heroes/hero_detail_screen.dart';
import 'package:my_first_app/ui/screens/settings/settings_screen.dart';

class AppRoutes {
  static const setting = '/settings';
  static const heroDetail = '/hero-detail';
  static const minionDetail = '/minion-detail';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments as AppRouterArguments?;

    final routes = <String, WidgetBuilder>{
      AppRoutes.setting: (BuildContext context) => const SettingsScreen(),
      AppRoutes.heroDetail: (BuildContext context) => HeroDetailScreen(
        hero: arg!.hero!,
      ),
/*      AppRoutes.minionDetail: (BuildContext context) => MinionDetailScreen(
        hero: arg!.minion!,
      ),*/
    };

    WidgetBuilder? builder = routes[settings.name];
    return MaterialPageRoute(builder: (ctx) => builder!(ctx));
  }
}

class AppRouterArguments {
  final HeroModel? hero;
  final String? text;
  final int? number;
  final MinionModel? minion;

  AppRouterArguments({
    this.hero,
    this.number,
    this.text,
    this.minion,
  });
}
