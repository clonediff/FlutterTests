import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/home_page_consumer_widget.dart';
import 'package:test_project/user.dart';

// Providers
// Provider - только на чтение
// StateProvider - Provider у которого есть State, но используется только с примитивными типами
// StateNotifier & StateNotifierProvider - Provider у которого есть State, но может использовать любые типы

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) => UserNotifier());

void main() {
  runApp(const ProviderScope(child: MyFirstApp()));
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
