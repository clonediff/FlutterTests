import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/bloc/user_bloc.dart';
import 'package:test_project/bloc/user_event.dart';
import 'package:test_project/default_appbar.dart';
import 'package:test_project/services/user_repository.dart';
import 'package:test_project/widgets/action_buttons.dart';
import 'package:test_project/widgets/user_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: BlocProvider(
        create: (context) =>
            UserBloc(userRepository: context.read<UserRepository>())
              ..add(UserLoadEvent()),
        child: Scaffold(
          appBar: DefaultAppBar(
            title: const Text('User list'),
          ),
          backgroundColor: Colors.white,
          body: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ActionButtons(),
              Expanded(child: UserList()),
            ],
          ),
        ),
      ),
    );
  }
}
