import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/home_page_consumer_widget.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/user.dart';

// Providers
// Provider - только на чтение
// StateProvider - Provider у которого есть State, но используется только с примитивными типами
// StateNotifier & StateNotifierProvider - Provider у которого есть State, но может использовать любые типы
// ChangeNotifierProvider - Не рекомендуется использовать как новый Provider (т.к. состояние можно изменить без согласования с провайдером), используется только для совместимости с пакетом Provider
// FutureProvider - удобная работа с Future
// StreamProvider - для работы со Stream

final fetchUserProvider = FutureProvider(
  (ref) {
    final userRepository = ref.watch(userRepositoryProvider);
    return userRepository.fetchUserData();
  },
);

final streamProvider = StreamProvider(
  (ref) {
    return Stream.periodic(
      const Duration(seconds: 1),
      (computationCount) => computationCount,
    );
  },
);

void main() {
  runApp(const ProviderScope(child: MyFirstApp()));
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
