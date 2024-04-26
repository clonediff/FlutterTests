import 'package:flutter/material.dart';
import 'package:test_project/value_key_example_1.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const ValueKeyExample1(),
    );
  }
}
