import 'package:flutter/cupertino.dart';
import 'package:my_first_app/data/model/hero.dart';
import 'package:my_first_app/data/model/minion.dart';
import 'package:my_first_app/ui/route.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigatorService({required this.navigatorKey});

  void onSettings() {
    navigatorKey.currentState!.pushNamed(AppRoutes.setting);
  }

  void onHeroDetail({required HeroModel hero}) {
    navigatorKey.currentState!.pushNamed(
      AppRoutes.heroDetail,
      arguments: AppRouterArguments(hero: hero),
    );
  }
  void onMinionDetail({required MinionModel minion}) {
    navigatorKey.currentState!.pushNamed(
      AppRoutes.minionDetail,
      arguments: AppRouterArguments(minion: minion),
    );
  }
}
