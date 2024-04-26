import 'package:flutter/material.dart';

class ValueKeyExample2 extends StatefulWidget {
  const ValueKeyExample2({super.key});

  @override
  State<ValueKeyExample2> createState() => _ValueKeyExample2State();
}

class _ValueKeyExample2State extends State<ValueKeyExample2> {
  bool showEmail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueKey Example 2'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showEmail)
              const TextField(
                key: ValueKey('email'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.email),
                  labelText: 'Email',
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            const TextField(
              key: ValueKey('username'),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.people),
                labelText: 'Username',
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () => setState(() {
          showEmail = false;
        }),
        icon: const Icon(Icons.visibility_off),
        label: const Text('Remove Email'),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: Colors.grey,
          textStyle: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
