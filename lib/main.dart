import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'IndieFlower'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Adding Assets'),
        ),
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              const Image(
                image: AssetImage('assets/images/bg.jpg'),
              ),
              Image.asset('assets/icons/icon.png'),
              const Positioned(
                top: 16,
                left: 100,
                child: Text(
                  'My custom font',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
