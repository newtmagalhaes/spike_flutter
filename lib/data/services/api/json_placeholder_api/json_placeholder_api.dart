import 'package:get/get.dart';
import 'package:spike_flutter/data/services/api/json_placeholder_api/models/user.dart';

class JsonPlaceholderApi {
  static final _baseURL = 'https://jsonplaceholder.typicode.com';
  late final GetHttpClient _httpClient;

  JsonPlaceholderApi({GetHttpClient? client}) {
    _httpClient = client ?? GetHttpClient(baseUrl: _baseURL);
  }

  Future<List<User>> listUsers() {
    return _httpClient
        .get(
          '/users',
          decoder: (data) => (data as List)
              .map((item) => Map<String, dynamic>.from(item))
              .map(User.fromJson)
              .toList(),
        )
        .then((r) => r.body!);
  }

  Future<User> retrieveUser(int id) {
    return _httpClient
        .get(
          '/users/$id',
          decoder: (data) => User.fromJson(Map<String, dynamic>.from(data)),
        )
        .then((response) => response.body!);
  }
}
