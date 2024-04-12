import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/bloc/user_bloc.dart';
import 'package:test_project/bloc/user_state.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        log(state.toString());
        if (state is UserLoadedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Users are Loaded'),
              duration: Duration(milliseconds: 500),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state) {
          case UserEmptyState _:
            return const Center(
              child: Text(
                'No data received. Press button "Load"',
                style: TextStyle(fontSize: 20),
              ),
            );
          case UserLoadingState _:
            return const Center(child: CircularProgressIndicator());
          case UserLoadedState loaded:
            return ListView.builder(
              itemCount: loaded.loadedUser.length,
              itemBuilder: (context, index) => Container(
                color: index % 2 == 0 ? Colors.white : Colors.blue.shade50,
                child: ListTile(
                  leading: Text(
                    'ID: ${loaded.loadedUser[index].id}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Column(
                    children: [
                      Text(
                        'My Name: ${loaded.loadedUser[index].name}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text(
                            'Email: ${loaded.loadedUser[index].email}',
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          ),
                          Text(
                            'Phone: ${loaded.loadedUser[index].phone}',
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          case UserErrorState _:
            return const Center(
              child: Text(
                'Error fetching users',
                style: TextStyle(fontSize: 20),
              ),
            );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
