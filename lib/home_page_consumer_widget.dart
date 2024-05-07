import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/main.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String userId = '1';

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(fetchUserProvider(userId));

    return user.when(
      data: (data) => Scaffold(
        appBar: AppBar(
          title: const Text(''),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextField(
              onSubmitted: (value) {
                userId = value;
                setState(() {});
              },
            ),
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
