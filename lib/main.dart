import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Providers HW',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ChangeNotifierProvider<ColorsState>(
        create: (BuildContext context) => ColorsState(),
        child: Consumer<ColorsState>(
          builder: (context, state, child) => Scaffold(
            appBar: AppBar(
              title: const Text('Providers HW'),
              centerTitle: true,
              backgroundColor: Colors.black,
              foregroundColor: state.appBarColor,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 100,
                    width: 100,
                    color: state.rectColor,
                  ),
                  Switch(
                    value: state.switchEnabled,
                    onChanged: (value) => state.genNewColors(value),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ColorsState extends ChangeNotifier {
  final Random _random = Random();

  late Color _appBarColor;

  Color get appBarColor => _appBarColor;

  late Color _rectColor;

  Color get rectColor => _rectColor;

  bool _switchEnabled = false;

  bool get switchEnabled => _switchEnabled;

  ColorsState() {
    _appBarColor = _randomColor();
    _rectColor = _randomColor();
  }

  void genNewColors(bool switchValue) {
    _appBarColor = _randomColor();
    _rectColor = _randomColor();
    _switchEnabled = switchValue;
    notifyListeners();
  }

  Color _randomColor() => Color.fromARGB(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
}
