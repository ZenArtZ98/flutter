import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';
import 'package:my_first_app/data/api/api.dart';
import 'package:my_first_app/data/repositories/hero_repository.dart';
import 'package:my_first_app/data/repositories/minion_repository.dart';
import 'package:my_first_app/domain/services/navigator_service.dart';
import 'package:my_first_app/ui/state_manager/heroes/middlewares.dart';
import 'package:my_first_app/ui/state_manager/characters/states.dart';
import 'package:my_first_app/ui/state_manager/profile/states.dart';
import 'package:my_first_app/ui/state_manager/reduser.dart';
import 'package:my_first_app/ui/state_manager/store.dart';


class LocatorService {
  final api = Api();
  final navigatorKey = GlobalKey<NavigatorState>();

  late HeroRepository heroRepository;
  late MinionRepository minionRepository;
  late NavigatorService navigatorService;

  late Store<AppState> store;


  LocatorService() {
    heroRepository = HeroRepository(api: api);
    minionRepository = MinionRepository(api: api);
    navigatorService = NavigatorService(navigatorKey: navigatorKey);

    store = Store(
      appReducer,
      initialState: AppState(
        profileState: ProfileState(),
        characterListState: CharacterListState(),
      ),
      middleware: [
        CharacterMiddleware(characterRepository: characterRepository).call,
      ],
    );


    _register();
  }

  void _register() {
    GetIt.I.registerSingleton<HeroRepository>(heroRepository);
    GetIt.I.registerSingleton<MinionRepository>(minionRepository);
    GetIt.I.registerSingleton<NavigatorService>(navigatorService);
  }
}
