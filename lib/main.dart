import 'package:flutter/material.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FirsScreenState();
}

class _FirsScreenState extends State<FirstScreen> {
  String text = 'Some Text';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: const Text('First screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                text,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                var route = MaterialPageRoute(
                    builder: (context) => const SecondScreen());
                Navigator.of(context).push(route).then((value) => {
                      setState(() {
                        text = value;
                      })
                    });
              },
              child: const Text(
                'Go to second screen',
                style: TextStyle(fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: const Text('Second screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: TextField(
              controller: textFieldController,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String textToSendBack = textFieldController.text;
              Navigator.of(context).pop(textToSendBack);
            },
            child: const Text(
              'Send text back',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}

class DefaultAppBar extends AppBar {
  DefaultAppBar({super.key, required Widget title})
      : super(
          title: title,
          backgroundColor: Colors.blue,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        );
}
