import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/main.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  void onNameSubmit(WidgetRef ref, String val) {
    ref.read(userChangeNotifierProvider).updateName(val);
  }

  void onAgeSubmit(WidgetRef ref, int val) {
    ref.read(userChangeNotifierProvider).updateAge(val);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userChangeNotifierProvider).user;

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) => onNameSubmit(ref, value),
          ),
          TextField(
            onSubmitted: (value) => onAgeSubmit(ref, int.parse(value)),
            keyboardType: TextInputType.number,
          ),
          Center(
            child: Text(user.age.toString()),
          ),
        ],
      ),
    );
  }
}
