import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spike_flutter/data/models/user_public.dart';
import 'package:spike_flutter/ui/components/user_card.dart';

import '../../seeds/users/user_public.dart';

Widget createMaterialBase(UserPublic user) =>
  MaterialApp(home: UserCard(user: user),);

void main() {
  group('UserCard tests', () {
    testWidgets('Deve conter campos de usuário', (widgetTester) async {
      final testUser = oneTestUserTemp();
      await widgetTester.pumpWidget(createMaterialBase(testUser));

      var userUsernameFinder = find.text(testUser.username);
      var userNameFinder = find.text(testUser.name);

      expect(userUsernameFinder, findsOneWidget);
      expect(userNameFinder, findsOneWidget);
    },);
  });
}
