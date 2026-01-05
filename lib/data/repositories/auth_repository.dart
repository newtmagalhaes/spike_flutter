import 'package:get/get.dart';
import 'package:spike_flutter/data/mappers/user_public_json_placeholder.dart';
import 'package:spike_flutter/data/models/user_public.dart';
import 'package:spike_flutter/data/repositories/mocked_user_repository.dart';
import 'package:spike_flutter/data/repositories/user_repository.dart';
import 'package:spike_flutter/data/services/api/json_placeholder_api/json_placeholder_api.dart';

class AuthRepository {
  static final single = AuthRepository();
  // final _userRepository = MockedUserRepository();
  final _userRepository = JsonPlaceholderUserRepository(
    jsonPlaceholderAPI: JsonPlaceholderApi(),
    userPublicJsonPlaceholder: UserPublicJsonPlaceholder(),
  );

  static AuthRepository getAuthRepository() => single;


  UserPublic? loggedUser;

  Future<UserPublic?> login(String username, String password) async {
    loggedUser = (await _userRepository.listUsers()).firstWhereOrNull((u) => u.username == username);
    return loggedUser;
  }

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
