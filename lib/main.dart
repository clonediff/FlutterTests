import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatefulWidget {
  const MyFirstApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyFirstAppState();
  }
}

class _MyFirstAppState extends State<MyFirstApp> {
  bool _loading = false;
  double _progressValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("My First App"),
          centerTitle: true,
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: _loading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LinearProgressIndicator(
                        value: _progressValue,
                      ),
                      Text(
                        '${(_progressValue * 100).round()} %',
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  )
                : const Text(
                    'Press button to download',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _loading = !_loading;
              _updateProgress();
            });
          },
          child: const Icon(Icons.cloud_download),
        ),
      ),
    );
  }

  void _updateProgress() {
    const oneSec = Duration(milliseconds: 100);
    Timer.periodic(oneSec, (timer) {
      setState(() {
        _progressValue += 0.1;

        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          timer.cancel();
          _progressValue = 0.0;
        }
      });
    });
  }
}
