import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Consumer(
              builder: (context, ref, child) {
                final name = ref.watch(nameProvider);
                return Text(name);
              },
            ),
          ),
        ],
      ),
    );
  }
}
