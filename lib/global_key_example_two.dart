import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_project/helpers.dart';

class GlobalKeyExampleTwo extends StatefulWidget {
  const GlobalKeyExampleTwo({super.key});

  @override
  State<GlobalKeyExampleTwo> createState() => _GlobalKeyExampleTwoState();
}

class _GlobalKeyExampleTwoState extends State<GlobalKeyExampleTwo> {
  final formKey = GlobalKey<FormState>();

  bool isSignedIn = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GlobalKey Example 2'),
        centerTitle: true,
      ),
      body: isSignedIn ? buildHome() : buildLogin(),
    );
  }

  Widget buildLogin() => Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  !value!.contains('@') ? 'Not a Valid Email!' : null,
              onSaved: (newValue) => email = newValue!,
            ),
            const SizedBox(height: 24),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  value!.length < 3 ? 'Password needs 3 characters' : null,
              onSaved: (newValue) => password = newValue!,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade700,
                minimumSize: const Size.fromHeight(40),
              ),
              onPressed: submit,
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      );

  Widget buildHome() => Container(
        padding: const EdgeInsets.all(24),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextRowWidget(title: 'Email', value: email),
            TextRowWidget(title: 'Password', value: password),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade700,
                minimumSize: const Size.fromHeight(40),
              ),
              child: const FittedBox(
                child: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              onPressed: () => setState(() => isSignedIn = false),
            )
          ],
        ),
      );

  void submit() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      log('Form valied: $email');

      setState(() => isSignedIn = true);
    }
  }
}
