import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String name,
    required String email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  factory User.fromStringJson(String jsonString) => User.fromJson(json.decode(jsonString));
}

@riverpod
UserRepository userRepository(UserRepositoryRef ref) => UserRepository();
// final userRepositoryProvider = Provider((ref) => UserRepository());

class UserRepository {
  Future<User> fetchUserData(String userId) {
    final url = 'https://jsonplaceholder.typicode.com/users/$userId';
    return http.get(Uri.parse(url)).then((value) => User.fromStringJson(value.body));
  }
}

// class UserNotifier extends StateNotifier<User> {
//   UserNotifier() : super(const User(name: '', age: 0));
//
//   void updateName(String n) => state = state.copyWith(name: n);
//
//   void updateAge(int age) => state = state.copyWith(age: age);
// }
//
// class UserNotifierChange extends ChangeNotifier {
//   User user = const User(name: '', age: 0);
//
//   void updateName(String n) {
//     user = user.copyWith(name: n);
//     notifyListeners();
//   }
//
//   void updateAge(int age) {
//     user = user.copyWith(age: age);
//     notifyListeners();
//   }
// }
