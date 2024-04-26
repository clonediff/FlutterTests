import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String name,
    required String country,
  }) = _User;
}

// class User {
//   final String name;
//   final String country;
//
//   const User({required this.name, required this.country});
// }
