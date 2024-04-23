part of 'counter_bloc.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState.initial() = _CounterInitialState;
  const factory CounterState.loading() = _CounterLoadingState;
  const factory CounterState.loaded({required int counter}) = _CounterLoadedState;
}
