import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/bloc/user_bloc.dart';
import 'package:test_project/bloc/user_event.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    // final UserBloc userBloc = BlocProvider.of<UserBloc>(context, listen: false);
    // final UserBloc userBloc = context.read<UserBloc>();
    // final UserBloc userBloc = BlocProvider.of<UserBloc>(context, listen: true);
    final UserBloc userBloc = context.watch<UserBloc>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            userBloc.add(UserLoadEvent());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: const Text('Load'),
        ),
        const SizedBox(
          width: 8,
        ),
        ElevatedButton(
          onPressed: () {
            userBloc.add(UserClearEvent());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text('Clear'),
        ),
      ],
    );
  }
}
