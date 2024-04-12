import 'package:flutter/material.dart';

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