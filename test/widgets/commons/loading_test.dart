import 'package:cryptoapp/widgets/commons/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Loading widget displays loading indicator and message',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Loading(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Carregando...'), findsOneWidget);

    final textFinder = find.text('Carregando...');
    final textWidget = tester.widget<Text>(textFinder);

    final indicatorWidget = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator));
    final progressIndicatorColor =
        (indicatorWidget.valueColor as AlwaysStoppedAnimation<Color>).value;

    final theme = Theme.of(tester.element(find.byType(Loading)));
    expect(progressIndicatorColor, theme.colorScheme.primary);

    final textColor = textWidget.style?.color ?? Colors.transparent;
    expect(textColor, theme.colorScheme.primary);
  });
}
