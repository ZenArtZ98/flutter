import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_first_app/data/model/hero.dart';

part 'states.freezed.dart';

@freezed
class HeroListState with _$HeroListState {
  factory HeroListState([
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default([]) List<HeroModel> heroes,
    @Default('') String error,
  ]) = _HeroListState;
}
