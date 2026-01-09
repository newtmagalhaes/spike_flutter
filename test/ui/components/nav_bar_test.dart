import 'package:flutter_test/flutter_test.dart';
import 'package:spike_flutter/ui/components/nav_bar.dart';

void main() {
  group('interações com NavBarMenu', () {
    testWidgets('Cria barra com título', (widgetTester) async {
      const titulo = 'Teste de Widget';
      await widgetTester.pumpWidget(NavBarMenu(title: titulo));

      final titleFinder = find.text(titulo);

      expect(titleFinder, findsOneWidget);
    });
  });
}
