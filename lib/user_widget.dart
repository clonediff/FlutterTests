import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_project/user.dart';

class UserWidget extends StatefulWidget {
  final User user;

  const UserWidget({
    super.key,
    required this.user,
  });

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  late Color color;

  @override
  void initState() {
    super.initState();
    color = generateColor();
  }

  Color generateColor() {
    final rnd = Random();
    return Color.fromARGB(
      255,
      rnd.nextInt(255),
      rnd.nextInt(255),
      rnd.nextInt(255),
    );
  }

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          title: Text(widget.user.name, style: const TextStyle(fontSize: 20)),
          subtitle:
              Text(widget.user.country, style: const TextStyle(fontSize: 20)),
          trailing: Text('HashCode: ${widget.user.hashCode}',
              style: const TextStyle(fontSize: 20)),
        ),
      );
}
