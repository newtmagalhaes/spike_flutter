import 'dart:convert';

import 'package:get/get.dart';
import 'package:spike_flutter/data/services/api/json_placeholder_api/converters/user_converter.dart';
import 'package:spike_flutter/data/services/api/json_placeholder_api/models/user.dart';

class JsonPlaceholderApi {
  static final _baseURL = 'https://jsonplaceholder.typicode.com';
  final _httpClient = GetHttpClient(baseUrl: _baseURL);
  final _userConverter = UserConverter();

  Future<List<User>> listUsers() async {
    var response = await _httpClient.get(
      '/users',
      decoder: (data) => _userConverter.fromJsonList(data),
    );

    return Future.value(response.body);
  }
}
