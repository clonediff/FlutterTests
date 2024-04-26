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
      Padding(
        key: UniqueKey(),
        padding: const EdgeInsets.all(8.0),
        child: StatefulColorWidget(text: '1'),
      ),
      Padding(
        key: UniqueKey(),
        padding: const EdgeInsets.all(8.0),
        child: StatefulColorWidget(text: '2'),
      ),
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

Т.е. Widget'ы переставляются, а Element'ы остаются на месте и переиспользуются, т.к. типы виджетов не поменялись, а ключи не заданы,
но привязываются к другим Widget'ам с новыми цветами

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

Т.е. Widget'ы переставляются, а Element'ы остаются на месте и переиспользуются, т.к. типы виджетов не поменялось, а ключи не заданы,
но привязываются к другим Widget'ам State'ы привязываются к Element'ам, поэтому то, что в Widget свапаются (text), а то, что в State'ах нет (myColor)

*/

/*

Widget Tree:                                              Widget Tree:
Row Widget                                                Row Widget
 ├-- ColorWidget 1 (Stateful Widget)                       ├-- ColorWidget 2 (Stateful Widget)
 |      └-- Widget Key 1                                   |      └-- Widget Key 2
 └-- ColorWidget 2 (Stateful Widget)                       └-- ColorWidget 1 (Stateful Widget)
        └-- Widget Key 2                                          └-- Widget Key 1
                                            --------->
ElementTree:                                              ElementTree:
Row Element                                               Row Element
 ├-- ColorElement 1 (Stateful Element)                     ├-- ColorElement 2 (Stateful Element)
 |      ├-- State 1                                        |      ├-- State 2
 |      └-- Element Key 1                                  |      └-- Element Key 2
 └-- ColorElement 2 (Stateful Element)                     └-- ColorElement 1 (Stateful Element)
        ├-- State 2                                               ├-- State 1
        └-- Element Key 2                                         └-- Element Key 1

1) Свапаются Widget'ы в Widget Tree
2) Начинается проверка по Element Tree:
    2.1) Проверяется RuntimeType старого виджета, и текущего виджета на текущем уровне. old: ColorWidget  == new: ColorWidget
    2.2) Проверяется Element Key и Widget key на одном уровне. old: WidgetKey2 != new: ElementKey1   =>   Вызывается свап Element'ов

 */

/*

Widget Tree:                                      ElementTree:
Row Widget                                        Row Element
 ├-- PaddingWidget1                                ├-- PaddingElement1
 |    └--ColorWidget 1 (Stateful Widget)           |     └--ColorElement 1 (Stateful Element)
 |         └-- Widget Key 1                        |          ├-- State 1
 |                                                 |          └-- Element Key 1
 └-- PaddingWidget2                                └-- PaddingElement2
      └--ColorWidget 2 (Stateful Widget)                 └--ColorElement 2 (Stateful Element)
           └-- Widget Key 2                                   ├-- State 2
                                                              └-- Element Key 2

Swap Widgets:

Widget Tree:                                      ElementTree:
Row Widget                                        Row Element
 ├-- PaddingWidget2                                ├-- PaddingElement1
 |    └--ColorWidget 2 (Stateful Widget)           |     └--ColorElement 1 (Stateful Element)
 |         └-- Widget Key 2                        |          ├-- State 1
 |                                                 |          └-- Element Key 1
 └-- PaddingWidget1                                └-- PaddingElement2
      └--ColorWidget 1 (Stateful Widget)                 └--ColorElement 2 (Stateful Element)
           └-- Widget Key 1                                   ├-- State 2
                                                              └-- Element Key 2

Checks:

RowElement:
  newType: Row Widget == oldType: Row Element.widget  ------┬----> Link to RowElement
  key: not defined                                    ------┘

  RowElement children:

  PaddingElement1:
  newType: PaddingWidget2 == oldType: PaddingElement1.widget -----┬----> Link to PaddingWidget2:
  key: not defined                                           -----┘

  PaddingElement2:
  newType: PaddingWidget1 == oldType: PaddingElement2.widget -----┬----> Link to PaddingWidget1:
  key: not defined                                           -----┘

    PaddingElement1 children:

    ColorElement1
    newType: ColorWidget2 == oldType: ColorElement1.widget ---┬---> Search new widget candidate among
    newKey: WidgetKey2 != oldKey: ElementKey1              ---┘     other PaddingElement1 children
                                                                              |
     ┌----  Create new ColorElement3 <-------- Deactivate ColorElement1 <-----┘
     |          with new State3
     |        with key ElementKey2
     |
     └--------> Link ColorElement3 to ColorWidget2

    PaddingElement2 children:

    ColorElement2
    newType: ColorWidget1 == oldType: ColorElement2.widget ---┬---> Search new widget candidate among
    newKey: WidgetKey1 != oldKey: ElementKey2              ---┘     other PaddingElement2 children
                                                                              |
     ┌----  Create new ColorElement4 <-------- Deactivate ColorElement2 <-----┘
     |           with new State4
     |         with key ElementKey1
     |
     └--------> Link ColorElement4 to ColorWidget1

new States of Trees:

Widget Tree:                                      ElementTree:
Row Widget                                        Row Element
 ├-- PaddingWidget2                                ├-- PaddingElement1
 |    └--ColorWidget 2 (Stateful Widget)           |     └--ColorElement 3 (Stateful Element)
 |         └-- Widget Key 2                        |          ├-- State 3
 |                                                 |          └-- Element Key 2
 └-- PaddingWidget1                                └-- PaddingElement2
      └--ColorWidget 1 (Stateful Widget)                 └--ColorElement 4 (Stateful Element)
           └-- Widget Key 1                                   ├-- State 4
                                                              └-- Element Key 1
*/
