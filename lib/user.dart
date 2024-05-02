import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String name,
    required int age,
  }) = _User;
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier() : super(const User(name: '', age: 0));

  void updateName(String n) => state = state.copyWith(name: n);
}
