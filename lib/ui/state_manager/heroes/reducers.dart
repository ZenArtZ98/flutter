import 'package:redux/redux.dart';
import 'package:my_first_app/ui/state_manager/heroes/actions.dart';
import 'package:my_first_app/ui/state_manager/heroes/states.dart';

final heroListReducer = combineReducers<HeroListState>([
  TypedReducer<HeroListState, LoadHeroListAction>(_loadHeroList).call,
  TypedReducer<HeroListState, ShowHeroListAction>(_showHeroList).call,
  TypedReducer<HeroListState, ErrorHeroListAction>(_errorHeroList).call,
]);

HeroListState _loadHeroList(
    HeroListState state,
    LoadHeroListAction action,
    ) =>
    state.copyWith(
      isLoading: true,
      isError: false,
    );

HeroListState _showHeroList(
    HeroListState state,
    ShowHeroListAction action,
    ) =>
    state.copyWith(
      isLoading: false,
      isError: false,
      characters: action.characters,
    );

HeroListState _errorHeroList(
    HeroListState state,
    ErrorHeroListAction action,
    ) =>
    state.copyWith(
      isLoading: false,
      isError: true,
      error: action.error,
    );
