import 'package:get/get.dart';
import 'package:spike_flutter/data/models/user_public.dart';
import 'package:spike_flutter/data/repositories/user_repository.dart';

class AuthRepository {
  static final single = AuthRepository();
  // final _userRepository = MockedUserRepository();
  final _userRepository = JsonPlaceholderUserRepository();

  static AuthRepository getAuthRepository() => single;

  UserPublic? loggedUser;

  Future<UserPublic?> login(String username, String password) async =>
      _userRepository.listUsers()
      .then((users) => loggedUser = users.firstWhereOrNull((u) => u.username == username));

  void logout() => loggedUser = null;

  UserPublic? getLoggedUser() => loggedUser;
}

class TempUser implements UserPublic {
  TempUser(this.id, this.username, this.name);

  @override
  int id;

  @override
  late String name;

  @override
  late String username;
}
