import 'package:flutter/material.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = List<String>.generate(10000, (i) => 'Item #$i');

    return MaterialApp(
      home: Scaffold(
          appBar: DefaultAppBar(
            title: const Text('Building List View'),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(items[index]),
                leading: const Icon(Icons.insert_photo, color: Colors.red),
                trailing: const Icon(Icons.keyboard_arrow_right),
              ),
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
