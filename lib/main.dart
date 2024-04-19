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
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    double _size = 50;

    return Scaffold(
      appBar: DefaultAppBar(
        title: const Text('Vanilla Demo'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: _rating >= 1
                  ? const Icon(
                      Icons.star
                    )
                  : const Icon(
                      Icons.star_border
                    ),
              color: Colors.indigo.shade500,
              iconSize: _size,
              onPressed: (){
                setState(() {
                  _rating = 1;
                });
              },
            ),
            IconButton(
              icon: _rating >= 2
                  ? const Icon(
                  Icons.star
              )
                  : const Icon(
                  Icons.star_border
              ),
              color: Colors.indigo.shade500,
              iconSize: _size,
              onPressed: (){
                setState(() {
                  _rating = 2;
                });
              },
            ),
            IconButton(
              icon: _rating >= 3
                  ? const Icon(
                  Icons.star
              )
                  : const Icon(
                  Icons.star_border
              ),
              color: Colors.indigo.shade500,
              iconSize: _size,
              onPressed: (){
                setState(() {
                  _rating = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
