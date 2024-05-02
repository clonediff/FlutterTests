import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/main.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fetchUserProvider);

    return user.when(
      data: (data) => Scaffold(
          appBar: AppBar(
            title: const Text(''),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(
                child: Text(data.name),
              ),
            ],
          ),
        ),
      error: (error, stackTrace) => Scaffold(
          body: Center(
            child: Text(error.toString()),
          ),
        ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
