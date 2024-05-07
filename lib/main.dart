import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_project/home_page_consumer_widget.dart';
import 'package:test_project/logger_riverpod.dart';
import 'package:test_project/user.dart';

part 'main.g.dart';

// Providers
// Provider - только на чтение
// StateProvider - Provider у которого есть State, но используется только с примитивными типами
// StateNotifier & StateNotifierProvider - Provider у которого есть State, но может использовать любые типы
// ChangeNotifierProvider - Не рекомендуется использовать как новый Provider (т.к. состояние можно изменить без согласования с провайдером), используется только для совместимости с пакетом Provider
// FutureProvider - удобная работа с Future
// StreamProvider - для работы со Stream

@riverpod
String name(NameRef ref) {
  return 'Konstantin Kokorin';
}
// final nameProvider = Provider((ref) => 'Konstantin Kokorin');

@riverpod
Future<User> fetchUser(FetchUserRef ref, {required String userId, required int intValue, required bool boolValue}) {
  log('Init: fetchUser($userId)');
  ref.onCancel(() => log('Cancel: fetchUser($userId)'));
  ref.onResume(() => log('Resume: fetchUser($userId)'));
  ref.onDispose(() => log('Dispose: fetchUser($userId)'));

  final link = ref.keepAlive();

  Timer? timer;

  ref.onDispose(() => timer?.cancel());
  // Для удаления из кэша состояния провайдера используем link.close()
  ref.onCancel(() {
    timer = Timer(const Duration(seconds: 10), () => link.close());
  });
  ref.onResume(() => timer?.cancel());

  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData(userId);
}
// final fetchUserProvider = FutureProvider.autoDispose.family(
//   (ref, String userId) {
//     log('Init: fetchUser($userId)');
//     ref.onCancel(() => log('Cancel: fetchUser($userId)'));
//     ref.onResume(() => log('Resume: fetchUser($userId)'));
//     ref.onDispose(() => log('Dispose: fetchUser($userId)'));
//
//     final link = ref.keepAlive();
//
//     Timer? timer;
//
//     ref.onDispose(() => timer?.cancel());
//     // Для удаления из кэша состояния провайдера используем link.close()
//     ref.onCancel(() {
//       timer = Timer(const Duration(seconds: 10), () => link.close());
//     });
//     ref.onResume(() => timer?.cancel());
//
//     final userRepository = ref.watch(userRepositoryProvider);
//     return userRepository.fetchUserData(userId);
//   },
//   name: 'Future Provider',
// );

@riverpod
Stream stream(StreamRef ref) {
  return Stream.periodic(
    const Duration(seconds: 1),
        (computationCount) => computationCount,
  );
}
// final streamProvider = StreamProvider(
//   (ref) {
//     return Stream.periodic(
//       const Duration(seconds: 1),
//       (computationCount) => computationCount,
//     );
//   },
// );

void main() {
  runApp(ProviderScope(
    observers: [
      LoggerRiverpod(),
    ],
    child: const MyFirstApp(),
  ));
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
