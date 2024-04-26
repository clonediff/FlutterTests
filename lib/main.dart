import 'dart:math';

import 'package:flutter/material.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Widget> tiles;

  @override
  void initState() {
    super.initState();

    tiles = [
      StatefulColorWidget(text: '1'),
      StatefulColorWidget(text: '2'),
    ];
  }

  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UniqueKey'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        child: const Icon(Icons.swap_horiz, size: 32),
      ),
    );
  }
}

class StatelessColorWidget extends StatelessWidget {
  final Color myColor = GenerateColor.getColor();

  StatelessColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print(
        '$myColor element ${context.hashCode} render: ${context.findRenderObject()}');
    return Container(
      width: 150,
      height: 150,
      color: myColor,
    );
  }
}

class StatefulColorWidget extends StatefulWidget {
  final String text;

  const StatefulColorWidget({super.key, required this.text});

  @override
  State<StatefulColorWidget> createState() => _StatefulColorWidgetState();
}

class _StatefulColorWidgetState extends State<StatefulColorWidget> {
  final Color myColor = GenerateColor.getColor();

  @override
  Widget build(BuildContext context) {
    print(
        '$myColor element ${context.hashCode} render: ${context.findRenderObject()}');
    return Container(
      width: 150,
      height: 150,
      color: myColor,
      child: Center(
        child: Text(
          widget.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class GenerateColor {
  static final random = Random();

  static Color getColor() {
    return Color.fromARGB(
      255,
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
  }
}
/*

Widget Tree:                                                Widget Tree:
Row Widget                                                  Row Widget
 ├-- ColorWidget 1 (Stateless Widget)                        ├-- ColorWidget 2 (Stateless Widget)
 └-- ColorWidget 2 (Stateless Widget)                        └-- ColorWidget 1 (Stateless Widget)
                                              --------->
ElementTree:                                                ElementTree:
Row Element                                                 Row Element
 ├-- ColorElement 1 (Stateless Element)                      ├-- ColorElement 1 (Stateless Element)
 └-- ColorElement 2 (Stateless Element)                      └-- ColorElement 2 (Stateless Element)

Т.е. Widget'ы переставляются, а Element'ы остаются на месте и переиспользуются, т.к. типы виджетов не поменялось, но привязываются к другим Widget'ам с новыми цветами

 */


/*

Widget Tree:                                              Widget Tree:
Row Widget                                                Row Widget
 ├-- ColorWidget 1 (Stateful Widget)                       ├-- ColorWidget 2 (Stateful Widget)
 └-- ColorWidget 2 (Stateful Widget)                       └-- ColorWidget 1 (Stateful Widget)
                                            --------->
ElementTree:                                              ElementTree:
Row Element                                               Row Element
 ├-- ColorElement 1 (Stateful Element) -> State 1          ├-- ColorElement 1 (Stateful Element) -> State 1
 └-- ColorElement 2 (Stateful Element) -> State 2          └-- ColorElement 2 (Stateful Element) -> State 2

Т.е. Widget'ы переставляются, а Element'ы остаются на месте и переиспользуются, т.к. типы виджетов не поменялось, но привязываются к другим Widget'ам
State'ы привязываются к Element'ам, поэтому то, что в Widget свапаются (text), а то, что в State'ах нет (myColor)

 */
