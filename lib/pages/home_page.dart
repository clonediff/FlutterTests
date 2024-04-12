import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/bloc/user_bloc.dart';
import 'package:test_project/bloc/user_event.dart';
import 'package:test_project/bloc/user_state.dart';
import 'package:test_project/cubit/internet_cubit.dart';
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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                UserBloc(userRepository: context.read<UserRepository>())
                  ..add(UserLoadEvent()),
          ),
          BlocProvider(
            create: (context) => ConnectionCubit(),
          )
        ],
        child: Scaffold(
          appBar: DefaultAppBar(
            title: BlocBuilder<ConnectionCubit, MyConnectionState>(
              builder: (context, state) => state.connected
                  ? const Text('User List (в сети)')
                  : const Text(
                      'Нет соединения с интернетом',
                      style: TextStyle(color: Colors.red),
                    ),
            ),
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
