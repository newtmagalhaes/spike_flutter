import 'package:get/get.dart';
import 'package:spike_flutter/data/models/user_public.dart';

class AuthRepository {
  static final single = AuthRepository();

  static AuthRepository getAuthRepository() => single;

  List<UserPublic> users = [TempUser("img-00.png", "anilton", "anilton M")];

  UserPublic? loggedUser;

  UserPublic? login(String username, String password) {
    loggedUser = users.firstWhereOrNull((u) => u.username == username);
    return loggedUser;
  }

  void logout() => loggedUser = null;

  UserPublic? getLoggedUser() => loggedUser;
}

class TempUser implements UserPublic {
  TempUser(this.imgId, this.username, this.name);

  @override
  String? imgId;

  @override
  late String name;

  @override
  late String username;
}
