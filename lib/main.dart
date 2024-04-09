import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        body: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.asset('assets/images/bg.jpg'),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(30),
                color: Colors.red,
                child: const Text('1'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(30),
                color: Colors.green,
                child: const Text('2'),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(30),
                color: Colors.blue,
                child: const Text('3'),
              ),
            ),
          ],
        ),
      ),
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
