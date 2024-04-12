import 'package:test_project/model/user.dart';
import 'package:test_project/services/user_api_provider.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<List<User>> getAllUsers() => _userProvider.getUsers();
}