import 'package:flutter/material.dart';
import 'package:test_project/list_grid_view_pagestirage_key_page.dart';
import 'package:test_project/persist_pagestorage_key_page.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Storage Key'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ListGridViewPageStorageKeyPage(),
              )),
              child: const Text('ListGridViewPageStorageKeyPage'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PersistPageStorageKeyPage(),
              )),
              child: const Text('PersistPageStorageKeyPage'),
            ),
          ],
        ),
      ),
    );
  }
}
