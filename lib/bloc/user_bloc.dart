import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/bloc/user_event.dart';
import 'package:test_project/bloc/user_state.dart';
import 'package:test_project/model/user.dart';
import 'package:test_project/services/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserEmptyState()) {
    on<UserLoadEvent>(
      (event, emit) async {
        emit(UserLoadingState());

        try {
          final List<User> loadedUserList = await userRepository.getAllUsers();

          emit(UserLoadedState(loadedUser: loadedUserList));
        } catch (_) {
          emit(UserErrorState());
        }
      },
    );
    on<UserClearEvent>(
      (event, emit) {
        emit(UserEmptyState());
      },
    );
  }
}
