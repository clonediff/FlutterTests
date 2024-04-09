import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: DefaultAppBar(
            title: const Text('Building layouts'),
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.indigo.shade100,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Icon(Icons.adjust, size: 50, color: Colors.red),
                Icon(Icons.adjust, size: 200, color: Colors.green),
                Icon(Icons.adjust, size: 50, color: Colors.blue),
                Icon(Icons.adjust, size: 50, color: Colors.orange),
              ],
            ),
          )),
    );
  }
}

class DefaultAppBar extends AppBar {
  DefaultAppBar({super.key, required Widget title})
      : super(
          title: title,
          backgroundColor: Colors.blue,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        );
}
