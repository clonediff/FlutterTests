import 'package:flutter/material.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: const Text('First Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            const user = User(name: 'Konstantin', age: 34);
            Route route = MaterialPageRoute(
              builder: (context) => const SecondHome(user: user),
            );
            Navigator.of(context).push(route);
          },
          child: const Text('Second Home'),
        ),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  final User user;

  const SecondHome({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: Text('${user.name} - ${user.age}'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Go back'),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;

  const User({required this.name, required this.age});
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
