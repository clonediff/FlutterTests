import 'package:flutter/material.dart';
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

  void updateAge(int age) => state = state.copyWith(age: age);
}

class UserNotifierChange extends ChangeNotifier {
  User user = const User(name: '', age: 0);

  void updateName(String n) {
    user = user.copyWith(name: n);
    notifyListeners();
  }

  void updateAge(int age) {
    user = user.copyWith(age: age);
    notifyListeners();
  }
}
