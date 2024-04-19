import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: const Text('Inherited Widget'),
      ),
      body: ScopedModel<MyModelState>(
        model: MyModelState(),
        child: const AppRootWidget(),
      ),
    );
  }
}

class AppRootWidget extends StatelessWidget {
  const AppRootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyModelState>(
      builder: (context, child, model) => Card(
        elevation: 4,
        child: Column(
          children: [
            Text('(Root widget)',
                style: Theme.of(context).textTheme.displayLarge),
            Text('${model.counterValue}',
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
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyModelState>(
      rebuildOnChange: true,
      builder: (context, child, model) => Card(
        margin: const EdgeInsets.all(4).copyWith(bottom: 32),
        color: Colors.yellowAccent,
        child: Column(
          children: [
            const Text('(Child Widget)'),
            Text('${model.counterValue}',
                style: Theme.of(context).textTheme.displayLarge),
            ButtonBar(
              children: [
                IconButton(
                  onPressed: () => model._decrementCounter(),
                  icon: const Icon(Icons.remove),
                  color: Colors.red,
                ),
                IconButton(
                  onPressed: () => model._incrementCounter(),
                  icon: const Icon(Icons.add),
                  color: Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyModelState extends Model {
  int _counter = 0;

  int get counterValue => _counter;

  void _incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void _decrementCounter() {
    _counter--;
    notifyListeners();
  }
}
