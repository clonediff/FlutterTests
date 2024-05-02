import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/main.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Рекомендуется использовать в build, для отслеживания состояния Provider'а
    final name = ref.watch(nameProvider);
    // Рекомендуется использовать в initState для разового чтения Provider'а
    final nameRead = ref.read(nameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text(name),
          ),
        ],
      ),
    );
  }
}
