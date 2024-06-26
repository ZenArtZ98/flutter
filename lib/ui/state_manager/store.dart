import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_first_app/ui/state_manager/heroes/states.dart';
import 'package:my_first_app/ui/state_manager/profile/states.dart';

part 'store.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required ProfileState profileState,
    required HeroListState heroListState,
  }) = _AppState;
}
