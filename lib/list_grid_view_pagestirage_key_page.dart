import 'package:flutter/material.dart';

class ListGridViewPageStorageKeyPage extends StatefulWidget {
  const ListGridViewPageStorageKeyPage({super.key});

  @override
  State<ListGridViewPageStorageKeyPage> createState() =>
      _ListGridViewPageStorageKeyPageState();
}

class _ListGridViewPageStorageKeyPageState
    extends State<ListGridViewPageStorageKeyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Storage Key'),
        centerTitle: true,
      ),
      body: PageView.builder(
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return Container(
                color: Colors.grey.shade700,
                child: const _ListPage(
                  key: PageStorageKey('FirstPage'),
                ),
              );
            case 1:
              return Container(
                color: Colors.black,
                child: const Center(
                  child: Text(
                    'Blank Page',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              );
            case 2:
              return Container(
                color: Colors.grey.shade700,
                child: const _GridPage(
                  key: PageStorageKey('ThirdPage'),
                ),
              );
            default:
              throw '404';
          }
        },
        itemCount: 3,
      ),
    );
  }
}

class _ListPage extends StatelessWidget {
  const _ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          'Element - ${index + 1}',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class _GridPage extends StatelessWidget {
  const _GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => GridTile(
        child: Center(
          child: Text(
            'Grid item ${index + 1}',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
