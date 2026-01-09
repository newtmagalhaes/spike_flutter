import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spike_flutter/ui/views/home.dart';

Widget createHomeWidget() =>
  MaterialApp(home: HomePage(),);

void main() {
  group('Home page tests', () {
    testWidgets('deve ter tela', (widgetTester) async {
      await widgetTester.pumpWidget(createHomeWidget());

      var appBarTitleFinder = find.text('Home');

      expect(appBarTitleFinder, findsOneWidget);
    },);
  });
}
