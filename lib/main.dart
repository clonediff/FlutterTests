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
          title: const Text('Building List View'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          // Позволяет изменить размер ListView по размеру содержимого
          // shrinkWrap: true,
          // scrollDirection: Axis.horizontal,
          // itemExtent: 300,
          // reverse: true,
          children: const [
            ListTile(
              title: Text('Sunny'),
              subtitle: Text('Today Clear'),
              leading: Icon(Icons.wb_sunny),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            ListTile(
              title: Text('Cloudy'),
              subtitle: Text('Today Cloudy'),
              leading: Icon(Icons.wb_cloudy),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            ListTile(
              title: Text('Snow'),
              subtitle: Text('Today Snow'),
              leading: Icon(Icons.ac_unit),
              trailing: Icon(Icons.keyboard_arrow_right),
            )
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
