import 'package:flutter/material.dart';
import 'package:test_project/user.dart';
import 'package:test_project/user_widget.dart';

class ObjectKeyPageExample extends StatefulWidget {
  const ObjectKeyPageExample({super.key});

  @override
  State<ObjectKeyPageExample> createState() => _ObjectKeyPageExampleState();
}

class _ObjectKeyPageExampleState extends State<ObjectKeyPageExample> {
  late List<User> users;

  @override
  void initState() {
    super.initState();
    users = [
      User(
        name: 'Rayyan Markos',
        country: 'USA',
      ),
      User(
        name: 'Rayyan Markos',
        country: 'USA',
      ),
      User(
        name: 'Jonathan Vangelija',
        country: 'England',
      ),
      User(
        name: 'Kehlani Kalyan',
        country: 'India',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ObjectKey Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: users
              .map(
                (user) => UserWidget(key: ObjectKey(user), user: user),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        child: const Icon(Icons.swap_horiz, size: 32),
      ),
    );
  }

  void swapTiles() {
    setState(() {
      final user = users.removeAt(0);
      users.insert(1, user);
    });
  }
}
