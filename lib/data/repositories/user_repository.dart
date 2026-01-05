import 'package:spike_flutter/data/mappers/user_public_json_placeholder.dart';
import 'package:spike_flutter/data/models/user_public.dart';
import 'package:spike_flutter/data/services/api/json_placeholder_api/json_placeholder_api.dart';

class JsonPlaceholderUserRepository {
  final JsonPlaceholderApi _jsonPlaceholderAPI;
  final UserPublicJsonPlaceholder _userPublicJsonPlaceholder;

  JsonPlaceholderUserRepository({
    required JsonPlaceholderApi jsonPlaceholderAPI,
    required UserPublicJsonPlaceholder userPublicJsonPlaceholder,
  }) : _userPublicJsonPlaceholder = userPublicJsonPlaceholder,
       _jsonPlaceholderAPI = jsonPlaceholderAPI;

  Future<List<UserPublic>> listUsers() async {
    return _jsonPlaceholderAPI.listUsers().then(
      _userPublicJsonPlaceholder.fromAPIList,
    );
  }
}
