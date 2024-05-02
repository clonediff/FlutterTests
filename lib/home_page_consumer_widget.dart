import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/main.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  void onNameSubmit(WidgetRef ref, String val) {
    ref.read(userProvider.notifier).updateName(val);
  }

  void onAgeSubmit(WidgetRef ref, int val) {
    ref.read(userProvider.notifier).updateAge(val);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    // Не следует использовать внутри initState
    ref.listen(
      userProvider.select((value) => value.age),
      (previous, next) {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content:
                  Text('Our age was ${previous ?? 0} and the new age ${next}'),
            ),
          );
      },
    );

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
