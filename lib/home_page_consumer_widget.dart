import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/main.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamNumber = ref.watch(streamProvider);
    return Scaffold(
      body: streamNumber.when(
        data: (data) => Center(
          child: Text(
            data.toString(),
            style: const TextStyle(fontSize: 25),
          ),
        ),
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
