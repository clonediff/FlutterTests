import 'package:flutter/material.dart';
import 'package:test_project/default_appbar.dart';
import 'package:test_project/model/User.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key, required this.userInfo});

  final User userInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: const Text('User Info'),
      ),
      body: Card(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text(
                userInfo.name,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(userInfo.story ?? ""),
              leading: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              trailing: Text(userInfo.country ?? "Not selected"),
            ),
            ListTile(
              title: Text(
                userInfo.phone,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: const Icon(
                Icons.phone,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                userInfo.email ?? "",
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: const Icon(
                Icons.mail,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
