import 'dart:developer';

import 'package:flutter/material.dart';

class ValueKeyExample1 extends StatefulWidget {
  const ValueKeyExample1({super.key});

  @override
  State<ValueKeyExample1> createState() => _ValueKeyExample1State();
}

class _ValueKeyExample1State extends State<ValueKeyExample1> {
  late int counter;

  @override
  void initState() {
    counter = 0;
    log('# ValueKeyExample1 init state');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('# ValueKeyExample1 - call method build(context)');
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueKey Example 1'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ScaleAnimated(
              key: null,
              duration: const Duration(seconds: 2),
              child: Text('Виджет без ключа: $counter',
                  style: const TextStyle(fontSize: 30)),
            ),
            ScaleAnimated(
              key: ValueKey(counter),
              duration: const Duration(seconds: 2),
              child: Text('Виджет без ключа: $counter',
                  style: const TextStyle(fontSize: 30)),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.grey,
              ),
              child: const Text('Нажми меня'),
            ),
          ],
        ),
      ),
    );
  }
}

class ScaleAnimated extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const ScaleAnimated({
    super.key,
    required this.child,
    required this.duration,
  });

  @override
  State<ScaleAnimated> createState() => _ScaleAnimatedState();
}

class _ScaleAnimatedState extends State<ScaleAnimated>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    log('# ScaleAnimated init state');
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      upperBound: 1,
      lowerBound: 0,
    );
    _controller.forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
