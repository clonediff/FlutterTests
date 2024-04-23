// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CounterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function() reset,
    required TResult Function() increment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function()? reset,
    TResult? Function()? increment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function()? reset,
    TResult Function()? increment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CounterStartEvent value) start,
    required TResult Function(CounterResetEvent value) reset,
    required TResult Function(CounterIncrementEvent value) increment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CounterStartEvent value)? start,
    TResult? Function(CounterResetEvent value)? reset,
    TResult? Function(CounterIncrementEvent value)? increment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CounterStartEvent value)? start,
    TResult Function(CounterResetEvent value)? reset,
    TResult Function(CounterIncrementEvent value)? increment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterEventCopyWith<$Res> {
  factory $CounterEventCopyWith(
          CounterEvent value, $Res Function(CounterEvent) then) =
      _$CounterEventCopyWithImpl<$Res, CounterEvent>;
}

/// @nodoc
class _$CounterEventCopyWithImpl<$Res, $Val extends CounterEvent>
    implements $CounterEventCopyWith<$Res> {
  _$CounterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CounterStartEventImplCopyWith<$Res> {
  factory _$$CounterStartEventImplCopyWith(_$CounterStartEventImpl value,
          $Res Function(_$CounterStartEventImpl) then) =
      __$$CounterStartEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CounterStartEventImplCopyWithImpl<$Res>
    extends _$CounterEventCopyWithImpl<$Res, _$CounterStartEventImpl>
    implements _$$CounterStartEventImplCopyWith<$Res> {
  __$$CounterStartEventImplCopyWithImpl(_$CounterStartEventImpl _value,
      $Res Function(_$CounterStartEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CounterStartEventImpl implements CounterStartEvent {
  const _$CounterStartEventImpl();

  @override
  String toString() {
    return 'CounterEvent.start()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CounterStartEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function() reset,
    required TResult Function() increment,
  }) {
    return start();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function()? reset,
    TResult? Function()? increment,
  }) {
    return start?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function()? reset,
    TResult Function()? increment,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CounterStartEvent value) start,
    required TResult Function(CounterResetEvent value) reset,
    required TResult Function(CounterIncrementEvent value) increment,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CounterStartEvent value)? start,
    TResult? Function(CounterResetEvent value)? reset,
    TResult? Function(CounterIncrementEvent value)? increment,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CounterStartEvent value)? start,
    TResult Function(CounterResetEvent value)? reset,
    TResult Function(CounterIncrementEvent value)? increment,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class CounterStartEvent implements CounterEvent {
  const factory CounterStartEvent() = _$CounterStartEventImpl;
}

/// @nodoc
abstract class _$$CounterResetEventImplCopyWith<$Res> {
  factory _$$CounterResetEventImplCopyWith(_$CounterResetEventImpl value,
          $Res Function(_$CounterResetEventImpl) then) =
      __$$CounterResetEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CounterResetEventImplCopyWithImpl<$Res>
    extends _$CounterEventCopyWithImpl<$Res, _$CounterResetEventImpl>
    implements _$$CounterResetEventImplCopyWith<$Res> {
  __$$CounterResetEventImplCopyWithImpl(_$CounterResetEventImpl _value,
      $Res Function(_$CounterResetEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CounterResetEventImpl implements CounterResetEvent {
  const _$CounterResetEventImpl();

  @override
  String toString() {
    return 'CounterEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CounterResetEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function() reset,
    required TResult Function() increment,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function()? reset,
    TResult? Function()? increment,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function()? reset,
    TResult Function()? increment,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CounterStartEvent value) start,
    required TResult Function(CounterResetEvent value) reset,
    required TResult Function(CounterIncrementEvent value) increment,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CounterStartEvent value)? start,
    TResult? Function(CounterResetEvent value)? reset,
    TResult? Function(CounterIncrementEvent value)? increment,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CounterStartEvent value)? start,
    TResult Function(CounterResetEvent value)? reset,
    TResult Function(CounterIncrementEvent value)? increment,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class CounterResetEvent implements CounterEvent {
  const factory CounterResetEvent() = _$CounterResetEventImpl;
}

/// @nodoc
abstract class _$$CounterIncrementEventImplCopyWith<$Res> {
  factory _$$CounterIncrementEventImplCopyWith(
          _$CounterIncrementEventImpl value,
          $Res Function(_$CounterIncrementEventImpl) then) =
      __$$CounterIncrementEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CounterIncrementEventImplCopyWithImpl<$Res>
    extends _$CounterEventCopyWithImpl<$Res, _$CounterIncrementEventImpl>
    implements _$$CounterIncrementEventImplCopyWith<$Res> {
  __$$CounterIncrementEventImplCopyWithImpl(_$CounterIncrementEventImpl _value,
      $Res Function(_$CounterIncrementEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CounterIncrementEventImpl implements CounterIncrementEvent {
  const _$CounterIncrementEventImpl();

  @override
  String toString() {
    return 'CounterEvent.increment()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterIncrementEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function() reset,
    required TResult Function() increment,
  }) {
    return increment();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function()? reset,
    TResult? Function()? increment,
  }) {
    return increment?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function()? reset,
    TResult Function()? increment,
    required TResult orElse(),
  }) {
    if (increment != null) {
      return increment();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CounterStartEvent value) start,
    required TResult Function(CounterResetEvent value) reset,
    required TResult Function(CounterIncrementEvent value) increment,
  }) {
    return increment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CounterStartEvent value)? start,
    TResult? Function(CounterResetEvent value)? reset,
    TResult? Function(CounterIncrementEvent value)? increment,
  }) {
    return increment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CounterStartEvent value)? start,
    TResult Function(CounterResetEvent value)? reset,
    TResult Function(CounterIncrementEvent value)? increment,
    required TResult orElse(),
  }) {
    if (increment != null) {
      return increment(this);
    }
    return orElse();
  }
}

abstract class CounterIncrementEvent implements CounterEvent {
  const factory CounterIncrementEvent() = _$CounterIncrementEventImpl;
}

/// @nodoc
mixin _$CounterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int counter) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int counter)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int counter)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CounterInitialState value) initial,
    required TResult Function(_CounterLoadingState value) loading,
    required TResult Function(_CounterLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CounterInitialState value)? initial,
    TResult? Function(_CounterLoadingState value)? loading,
    TResult? Function(_CounterLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CounterInitialState value)? initial,
    TResult Function(_CounterLoadingState value)? loading,
    TResult Function(_CounterLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterStateCopyWith<$Res> {
  factory $CounterStateCopyWith(
          CounterState value, $Res Function(CounterState) then) =
      _$CounterStateCopyWithImpl<$Res, CounterState>;
}

/// @nodoc
class _$CounterStateCopyWithImpl<$Res, $Val extends CounterState>
    implements $CounterStateCopyWith<$Res> {
  _$CounterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CounterInitialStateImplCopyWith<$Res> {
  factory _$$CounterInitialStateImplCopyWith(_$CounterInitialStateImpl value,
          $Res Function(_$CounterInitialStateImpl) then) =
      __$$CounterInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CounterInitialStateImplCopyWithImpl<$Res>
    extends _$CounterStateCopyWithImpl<$Res, _$CounterInitialStateImpl>
    implements _$$CounterInitialStateImplCopyWith<$Res> {
  __$$CounterInitialStateImplCopyWithImpl(_$CounterInitialStateImpl _value,
      $Res Function(_$CounterInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CounterInitialStateImpl implements _CounterInitialState {
  const _$CounterInitialStateImpl();

  @override
  String toString() {
    return 'CounterState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int counter) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int counter)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int counter)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CounterInitialState value) initial,
    required TResult Function(_CounterLoadingState value) loading,
    required TResult Function(_CounterLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CounterInitialState value)? initial,
    TResult? Function(_CounterLoadingState value)? loading,
    TResult? Function(_CounterLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CounterInitialState value)? initial,
    TResult Function(_CounterLoadingState value)? loading,
    TResult Function(_CounterLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _CounterInitialState implements CounterState {
  const factory _CounterInitialState() = _$CounterInitialStateImpl;
}

/// @nodoc
abstract class _$$CounterLoadingStateImplCopyWith<$Res> {
  factory _$$CounterLoadingStateImplCopyWith(_$CounterLoadingStateImpl value,
          $Res Function(_$CounterLoadingStateImpl) then) =
      __$$CounterLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CounterLoadingStateImplCopyWithImpl<$Res>
    extends _$CounterStateCopyWithImpl<$Res, _$CounterLoadingStateImpl>
    implements _$$CounterLoadingStateImplCopyWith<$Res> {
  __$$CounterLoadingStateImplCopyWithImpl(_$CounterLoadingStateImpl _value,
      $Res Function(_$CounterLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CounterLoadingStateImpl implements _CounterLoadingState {
  const _$CounterLoadingStateImpl();

  @override
  String toString() {
    return 'CounterState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int counter) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int counter)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int counter)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CounterInitialState value) initial,
    required TResult Function(_CounterLoadingState value) loading,
    required TResult Function(_CounterLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CounterInitialState value)? initial,
    TResult? Function(_CounterLoadingState value)? loading,
    TResult? Function(_CounterLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CounterInitialState value)? initial,
    TResult Function(_CounterLoadingState value)? loading,
    TResult Function(_CounterLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _CounterLoadingState implements CounterState {
  const factory _CounterLoadingState() = _$CounterLoadingStateImpl;
}

/// @nodoc
abstract class _$$CounterLoadedStateImplCopyWith<$Res> {
  factory _$$CounterLoadedStateImplCopyWith(_$CounterLoadedStateImpl value,
          $Res Function(_$CounterLoadedStateImpl) then) =
      __$$CounterLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$CounterLoadedStateImplCopyWithImpl<$Res>
    extends _$CounterStateCopyWithImpl<$Res, _$CounterLoadedStateImpl>
    implements _$$CounterLoadedStateImplCopyWith<$Res> {
  __$$CounterLoadedStateImplCopyWithImpl(_$CounterLoadedStateImpl _value,
      $Res Function(_$CounterLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$CounterLoadedStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CounterLoadedStateImpl implements _CounterLoadedState {
  const _$CounterLoadedStateImpl({required this.counter});

  @override
  final int counter;

  @override
  String toString() {
    return 'CounterState.loaded(counter: $counter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterLoadedStateImpl &&
            (identical(other.counter, counter) || other.counter == counter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, counter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterLoadedStateImplCopyWith<_$CounterLoadedStateImpl> get copyWith =>
      __$$CounterLoadedStateImplCopyWithImpl<_$CounterLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int counter) loaded,
  }) {
    return loaded(counter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(int counter)? loaded,
  }) {
    return loaded?.call(counter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int counter)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(counter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CounterInitialState value) initial,
    required TResult Function(_CounterLoadingState value) loading,
    required TResult Function(_CounterLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CounterInitialState value)? initial,
    TResult? Function(_CounterLoadingState value)? loading,
    TResult? Function(_CounterLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CounterInitialState value)? initial,
    TResult Function(_CounterLoadingState value)? loading,
    TResult Function(_CounterLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _CounterLoadedState implements CounterState {
  const factory _CounterLoadedState({required final int counter}) =
      _$CounterLoadedStateImpl;

  int get counter;
  @JsonKey(ignore: true)
  _$$CounterLoadedStateImplCopyWith<_$CounterLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
