import 'package:my_first_app/data/model/hero.dart';

abstract class HeroListAction {}

class LoadHeroListAction extends HeroListAction {}

class ShowHeroListAction extends HeroListAction {
  final List<HeroModel> heroes;

  ShowHeroListAction({required this.heroes});
}

class ErrorHeroListAction extends HeroListAction {
  final String error;

  ErrorHeroListAction({required this.error});
}
