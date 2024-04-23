import 'package:flutter/material.dart';
import 'package:test_project/models/user.dart';

void main() {
  User userA = User(name: 'User', age: 30);
  User userB = User(name: 'User', age: 35);
  print(userA.hashCode);
  print(userB.hashCode);
  print(userA == userB);
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const Placeholder(),
    );
  }
}
