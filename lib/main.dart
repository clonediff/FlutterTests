import 'package:flutter/material.dart';
import 'package:test_project/pages/register_form_page.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisterFormPage(),
    );
  }
}
