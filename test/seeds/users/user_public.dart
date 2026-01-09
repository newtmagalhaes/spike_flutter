import 'package:spike_flutter/data/models/user_public.dart';
import 'package:spike_flutter/data/repositories/auth_repository.dart';

UserPublic oneTestUserTemp({int? id, String? name, String? username}) =>
    TempUser(id ?? 1, username ?? 'testUsername', name ?? 'test user');
