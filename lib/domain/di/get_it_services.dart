import 'package:get_it/get_it.dart';
// import 'package:my_first_app/data/repositories/hero_repository.dart';
// import 'package:my_first_app/data/repositories/minion_repository.dart';
import 'package:my_first_app/domain/services/navigator_service.dart';

class GetItServices {
  // HeroRepository get heroRepository => GetIt.I.get<HeroRepository>();
  //
  // MinionRepository get minionRepository => GetIt.I.get<MinionRepository>();

  NavigatorService get navigatorService => GetIt.I.get<NavigatorService>();
}

final getItService = GetItServices();
