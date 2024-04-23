import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/bloc/counter_bloc.dart';
import 'package:test_project/pages/counter_page.dart';

void main() {
  runApp(const MyFirstApp());
}

// flutter pub run build_runner watch --delete-conflicting-outputs

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc()..add(const CounterEvent.start()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: const CounterPage(),
      ),
    );
  }
}
