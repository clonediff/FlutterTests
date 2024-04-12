import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/color_bloc.dart';
import 'package:test_project/default_appbar.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ColorBloc(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final ColorBloc bloc = BlocProvider.of<ColorBloc>(context);

    return Scaffold(
      appBar: DefaultAppBar(
        title: const Text('BLoC with flutter_bloc'),
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            height: 100,
            width: 100,
            color: currentColor,
            duration: const Duration(milliseconds: 500),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc.add(RedColorEvent());
            },
            backgroundColor: Colors.red,
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              bloc.add(GreenColorEvent());
            },
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
