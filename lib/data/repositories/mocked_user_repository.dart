import 'package:spike_flutter/data/models/user_public.dart';
import 'package:spike_flutter/data/repositories/auth_repository.dart';

class MockedUserRepository {
  Future<List<UserPublic>> listUsers() =>
      Future.value([TempUser(1, "anilton", "anilton M")]);
}
