import 'package:flutter_test/flutter_test.dart';
import 'package:spike_flutter/data/services/api/json_placeholder_api/json_placeholder_api.dart';

void main() {
  group('Testes de integração com JsonPlaceholderAPI', () {
    test('Listar usuários', () async {
      var api = JsonPlaceholderApi();

      var result = await api.listUsers();

      expect(result.length, 10);
    });

    test('Obter usuário por id', () async {
      var api = JsonPlaceholderApi();

      var result = await api.retrieveUser(1);

      expect(result.id, 1);
    });
  });
}
