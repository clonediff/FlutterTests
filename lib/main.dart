import 'package:flutter/material.dart';
import 'package:test_project/page/webview_page.dart';

void main() {
  runApp(const MyFirstApp());
}

// flutter pub run build_runner watch --delete-conflicting-outputs

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const WebViewPage(),
    );
  }
}
