import 'package:cryptoapp/widgets/commons/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('EmptyStateWidget displays correct message and icon',
      (WidgetTester tester) async {
    const testMessage = 'Nenhum registro encontrado';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: EmptyStateWidget(message: testMessage),
        ),
      ),
    );

    expect(find.byIcon(Icons.hourglass_empty), findsOneWidget);
    expect(find.text(testMessage), findsOneWidget);

    final textFinder = find.text(testMessage);
    final textWidget = tester.widget<Text>(textFinder);

    expect(textWidget.textAlign, TextAlign.center);
  });
}
