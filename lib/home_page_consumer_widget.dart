import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/main.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  void onSubmit(WidgetRef ref, String val) {
    ref.read(userProvider.notifier).updateName(val);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) => onSubmit(ref, value),
          ),
          Center(
            child: Text(user.name),
          ),
        ],
      ),
    );
  }
}
