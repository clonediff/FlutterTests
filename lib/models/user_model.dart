import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_project/models/location.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class User with _$User {
  const User._();

  @JsonSerializable(explicitToJson: true)
  const factory User({
    required String name,
    @Default(30) int? age,
    required List<Location> locations,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  String infoUser() {
    return 'my name is $name and I am $age years old';
  }
}

// class User {
//   final String name;
//   final int age;
//
//   const User({
//     required this.name,
//     required this.age,
//   });
// }
