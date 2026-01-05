import 'package:spike_flutter/data/models/user_public.dart';
import 'package:spike_flutter/data/repositories/auth_repository.dart';
import 'package:spike_flutter/data/services/api/json_placeholder_api/models/user.dart';

class UserPublicJsonPlaceholder {
  UserPublic fromAPI(User u) {
    return TempUser(u.id, u.username, u.name);
  }

  List<UserPublic> fromAPIList(List<User> l) => l.map(fromAPI).toList();
}
