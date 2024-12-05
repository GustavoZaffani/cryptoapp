import 'package:cryptoapp/widgets/commons/error_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ErrorState displays correct message and icon',
      (WidgetTester tester) async {
    const testMessage = 'Erro inesperado';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ErrorState(message: testMessage),
        ),
      ),
    );

    expect(find.byIcon(Icons.error_outline), findsOneWidget);
    expect(find.text(testMessage), findsOneWidget);

    final textFinder = find.text(testMessage);
    final textWidget = tester.widget<Text>(textFinder);
    expect(textWidget.textAlign, TextAlign.center);

    final iconWidget = tester.widget<Icon>(find.byIcon(Icons.error_outline));
    final textColor = (textWidget.style?.color ?? Colors.transparent);

    final theme = Theme.of(tester.element(find.byType(ErrorState)));
    expect(iconWidget.color, theme.colorScheme.error);
    expect(textColor, theme.colorScheme.error);
  });
}
