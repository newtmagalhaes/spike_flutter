import 'package:spike_flutter/data/mappers/base_mapper.dart';
import 'package:spike_flutter/data/mappers/user_public_json_placeholder.dart';
import 'package:spike_flutter/data/models/user_public.dart';
import 'package:spike_flutter/data/services/api/json_placeholder_api/json_placeholder_api.dart';
import 'package:spike_flutter/data/services/api/json_placeholder_api/models/user.dart';

class JsonPlaceholderUserRepository {
  late final JsonPlaceholderApi _api;
  late final BaseMapper<UserPublic, User> _mapper;

  JsonPlaceholderUserRepository({
    JsonPlaceholderApi? api,
    BaseMapper<UserPublic, User>? mapper,
  }) {
    _api = api ?? JsonPlaceholderApi();
    _mapper = mapper ?? UserPublicJsonPlaceholder.instance;
  }

  Future<List<UserPublic>> listUsers() async =>
      _api.listUsers().then(_mapper.fromAPIList);
}
