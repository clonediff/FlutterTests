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

final fetchUserProvider = FutureProvider
  // Вызывать Dispose как только слушатели этого провайдера исчезают из экрана
  // Если не использовать, то Provider перейдет в кэш до рестарта приложения
    .autoDispose
  // Можно передать только неизменяемые и сравниваемые объекты, можно использовать след. пакеты:
  // tuple
  // freezed
  // equitable
  // riverpod_generator
    .family(
  (ref, String userId) {
  // Позволяет сохранить состояние на некоторое время в кэше, но не до рестарта
    ref.keepAlive();
  // Можно добавить события на
    ref.onAddListener(() { });
    ref.onRemoveListener(() { });
    final userRepository = ref.watch(userRepositoryProvider);
    return userRepository.fetchUserData(userId);
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
