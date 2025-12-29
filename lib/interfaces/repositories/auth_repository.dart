import 'package:spike_flutter/interfaces/models/user_public.dart';

class AuthRepository {
  UserPublic getLoggedUser() => TempUser();
}


class TempUser implements UserPublic {
  TempUser() {
    username = "anilton";
    name = "anilton M";
    imgId = "img-00.png";
  }

  @override
  String? imgId;

  @override
  late String name;

  @override
  late String username;

}
