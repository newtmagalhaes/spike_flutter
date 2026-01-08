import 'package:spike_flutter/data/mappers/base_mapper.dart';
import 'package:spike_flutter/data/models/user_public.dart';
import 'package:spike_flutter/data/repositories/auth_repository.dart';
import 'package:spike_flutter/data/services/api/json_placeholder_api/models/user.dart';

class UserPublicJsonPlaceholder implements BaseMapper<UserPublic, User> {
  const UserPublicJsonPlaceholder();

  static final instance = const UserPublicJsonPlaceholder();

  @override
  UserPublic fromAPI(User u) => TempUser(u.id, u.username, u.name);

  @override
  User toAPI(UserPublic external) => throw UnimplementedError();
}
