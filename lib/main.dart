import 'package:flutter/material.dart';
import 'package:test_project/default_appbar.dart';
import 'package:test_project/offices.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<OfficesList> officesList;

  @override
  void initState() {
    super.initState();
    officesList = getOfficesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: const Text('Manual JSON Serialization'),
      ),
      body: FutureBuilder<OfficesList>(
        future: officesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.offices.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('${snapshot.data?.offices[index].name}'),
                      subtitle:
                      Text('${snapshot.data?.offices[index].address}'),
                      leading: Image.network(
                          '${snapshot.data?.offices[index].image}'),
                      isThreeLine: true,
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return const Text('Error');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}