import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<CountProvider>.value(value: CountProvider()),
          FutureProvider(
            create: (context) => UserProvider().loadUserData(),
            initialData: null,
          ),
          StreamProvider(
            create: (context) => EventProvider().intStream(),
            initialData: 0,
          ),
        ],
        child: DefaultTabController(
          length: 3,
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Provider Demo'),
                centerTitle: true,
                bottom: const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.add)),
                    Tab(icon: Icon(Icons.person)),
                    Tab(icon: Icon(Icons.message))
                  ],
                ),
              ),
              body: const TabBarView(
                children: [
                  MyCountPage(),
                  MyUserPage(),
                  MyEventPage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCountPage extends StatelessWidget {
  const MyCountPage({super.key});

  @override
  Widget build(BuildContext context) {
    CountProvider state = Provider.of<CountProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('ChangeNotifierProvider Example',
                style: TextStyle(fontSize: 20)),
            const SizedBox(height: 50),
            Text('${state.counterValue}',
                style: Theme.of(context).textTheme.displayLarge),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => state._decrementCount(),
                  color: Colors.red,
                  icon: const Icon(Icons.remove),
                ),
                Consumer<CountProvider>(
                  builder: (context, value, child) => IconButton(
                    onPressed: () => value._incrementCount(),
                    color: Colors.green,
                    icon: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyUserPage extends StatelessWidget {
  const MyUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text('FutureProvider Example, users loaded from a File'),
        ),
        Consumer<List<User>?>(
          builder: (context, users, child) => Expanded(
            child: users == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) => Container(
                      height: 50,
                      color: Colors.grey[(index * 200) % 400],
                      child: Center(
                        child: Text(
                            '${users[index].firstName} ${users[index].lastName} | ${users[index].website}'),
                      ),
                    ),
                  ),
          ),
          child: null,
        ),
      ],
    );
  }
}

class MyEventPage extends StatelessWidget {
  const MyEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    var value = Provider.of<int>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('StreamProvider Example',
              style: TextStyle(fontSize: 20)),
          const SizedBox(height: 50),
          Text('$value', style: Theme.of(context).textTheme.displayLarge),
        ],
      ),
    );
  }
}

class CountProvider extends ChangeNotifier {
  int _count = 0;

  int get counterValue => _count;

  void _incrementCount() {
    _count++;
    notifyListeners();
  }

  void _decrementCount() {
    _count--;
    notifyListeners();
  }
}

class UserProvider {
  final String _dataPath = 'assets/users.json';
  late List<User> users;

  Future<String> loadAsset() async {
    return await Future.delayed(const Duration(seconds: 10), () async {
      return await rootBundle.loadString(_dataPath);
    });
  }

  Future<List<User>?> loadUserData() async {
    var dataString = await loadAsset();
    Map<String, dynamic> jsonUserData = jsonDecode(dataString);
    users = UserList.fromJson(jsonUserData['users']).users;
    print('done loading users! ${jsonUserData['users']}');
    return users;
  }
}

class EventProvider {
  Stream<int> intStream() {
    Duration interval = const Duration(seconds: 2);
    return Stream.periodic(interval, (int count) => count);
  }
}

class User {
  final String firstName, lastName, website;

  const User({
    required this.firstName,
    required this.lastName,
    required this.website,
  });

  User.fromJson(Map<String, dynamic> json)
      : this(
          firstName: json['first_name'],
          lastName: json['last_name'],
          website: json['website'],
        );
}

class UserList {
  final List<User> users;

  UserList({required this.users});

  UserList.fromJson(List<dynamic> usersJson)
      : this(users: usersJson.map((user) => User.fromJson(user)).toList());
}
