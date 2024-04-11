import 'package:flutter/material.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const FirstHome(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const FirstHome(),
            );
          case '/second':
            User? user = settings.arguments as User?;
            return MaterialPageRoute(
              builder: (context) => SecondHome(user: user),
            );
          default:
        }
      },
    );
  }
}

class FirstHome extends StatelessWidget {
  const FirstHome({super.key});

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
            // const User? user = null;
            Navigator.of(context).pushNamed('/second', arguments: user);
          },
          child: const Text('Second Home'),
        ),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  final User? user;

  const SecondHome({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: Text(user == null ? 'User is not specified' : '${user!.name} - ${user!.age}'),
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

class UnknownRoute extends StatelessWidget {
  final String routeMessage;

  const UnknownRoute({super.key, required this.routeMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: const Text('Unknown route'),
      ),
      body: Text('Unknow route called: \n$routeMessage'),
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
