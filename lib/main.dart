import 'package:flutter/material.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ListItem> items = List<ListItem>.generate(
        10000,
        (i) => i % 6 == 0
            ? HeadingItem(title: 'Item #$i')
            : MessageItem(
                sender: 'Sender $i',
                body: 'Message body $i',
              ));

    return MaterialApp(
      home: Scaffold(
          appBar: DefaultAppBar(
            title: const Text('Building List View'),
          ),
          body: ListView.builder(itemBuilder: (context, index) {
            switch (items[index]) {
              case HeadingItem headingItem:
                return ListTile(
                  title: Text(
                    headingItem.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                );
              case MessageItem messageItem:
                return ListTile(
                  title: Text(messageItem.sender),
                  subtitle: Text(messageItem.body),
                  leading: const Icon(Icons.insert_photo, color: Colors.red),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                );
              default:
                throw UnimplementedError('Неизвестный тип элемента: ${items.runtimeType}');
            }
          })),
    );
  }
}

abstract class ListItem {}

class HeadingItem extends ListItem {
  final String title;

  HeadingItem({required this.title});
}

class MessageItem extends ListItem {
  final String sender;
  final String body;

  MessageItem({required this.sender, required this.body});
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
