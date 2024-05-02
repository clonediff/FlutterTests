import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/main.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider) ?? '';

    void onSubmit(String val) {
      ref.read(nameProvider.notifier).update((state) => val);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: onSubmit,
          ),
          Center(
            child: Text(name),
          ),
        ],
      ),
    );
  }
}
