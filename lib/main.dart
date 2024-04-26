import 'package:flutter/material.dart';
import 'package:test_project/global_key_exaample_one.dart';

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
      home: const GlobalKeyExampleOne(),
    );
  }
}
