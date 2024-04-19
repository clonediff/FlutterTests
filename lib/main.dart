import 'package:flutter/material.dart';
import 'package:test_project/default_appbar.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  int get counterValue => _counter;

  void _incrementCounter() => setState(() => _counter++);

  void _decrementCounter() => setState(() => _counter--);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: const Text('Inherited Widget'),
      ),
      body: MyInheritedWidget(
        myState: this,
        child: const AppRootWidget(),
      ),
    );
  }
}

class AppRootWidget extends StatelessWidget {
  const AppRootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final rootWidgetState = MyInheritedWidget.of(context);
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Text('(Root widget)',
              style: Theme.of(context).textTheme.displayLarge),
          Text('${rootWidgetState._myState.counterValue}',
              style: Theme.of(context).textTheme.displayLarge),
          const SizedBox(height: 50),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Counter(),
              Counter(),
            ],
          ),
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    final rootWidgetState = MyInheritedWidget.of(context);
    return Card(
      margin: const EdgeInsets.all(4).copyWith(bottom: 32),
      color: Colors.yellowAccent,
      child: Column(
        children: [
          const Text('(Child Widget)'),
          Text('${rootWidgetState._myState.counterValue}',
              style: Theme.of(context).textTheme.displayLarge),
          ButtonBar(
            children: [
              IconButton(
                onPressed: () => rootWidgetState._myState._decrementCounter(),
                icon: const Icon(Icons.remove),
                color: Colors.red,
              ),
              IconButton(
                onPressed: () => rootWidgetState._myState._incrementCounter(),
                icon: const Icon(Icons.add),
                color: Colors.green,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final _HomePageState _myState;

  const MyInheritedWidget({super.key, required super.child, required myState})
      : _myState = myState;

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return _myState.counterValue != oldWidget._myState.counterValue;
  }

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()!;
  }
}
