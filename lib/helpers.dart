import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String title) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            title,
            style: const TextStyle(fontSize: 32),
          ),
        ),
      );
  }
}

class TextRowWidget extends StatelessWidget {
  final String title;
  final String value;

  const TextRowWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(fontSize: 24),
              ),
            )
          ],
        ),
      );
}
