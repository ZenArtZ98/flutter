import 'package:redux/redux.dart';
import 'package:my_first_app/data/repositories/hero_repository.dart';
import 'package:my_first_app/ui/state_manager/heroes/actions.dart';
import 'package:my_first_app/ui/state_manager/store.dart';

class HeroMiddleware implements MiddlewareClass<AppState> {
  final HeroRepository heroRepository;

  HeroMiddleware({required this.heroRepository});

  @override
  call(Store<AppState> store, action, NextDispatcher next) {
    if (action is LoadHeroListAction) {
      Future(() async {
        final answer = await heroRepository.getListHero();
        if (answer.data != null) {
          if (answer.data!.isEmpty) {
            store.dispatch(ErrorHeroListAction(error: 'Героев нет'));
          }
          store.dispatch(ShowHeroListAction(heroes: answer.data!));
        } else {
          store.dispatch(ErrorHeroListAction(error: answer.error!));
        }
      });
    }

    next(action);
  }
}
