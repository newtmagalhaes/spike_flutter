import 'package:spike_flutter/data/services/api/json_placeholder_api/converters/base_json_converter.dart';
import 'package:spike_flutter/data/services/api/json_placeholder_api/models/user.dart';

class UserConverter extends BaseJsonConverter<User> {
  @override
  Map<String, dynamic> toJson(obj) {
    return {
      'id': obj.id,
      'name': obj.name,
      'username': obj.username,
      'email': obj.email,
    };
  }

  @override
  User fromJson(Map<String, dynamic> json) {
    if (
        json.containsKey('id')
        && json.containsKey('name')
    ) {
      var {'id': id, 'name': name, 'username': username, 'email': email} = json;
      
      return User(id: id, name: name, username: username, email: email);
    }
    throw Exception('json inválido');
  }

}
