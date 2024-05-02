import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/home_page_stateless_widget.dart';

// Providers
// Provider

final nameProvider = Provider<String>((ref) {
  return 'Rail';
});

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
