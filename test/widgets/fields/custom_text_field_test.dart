import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cryptoapp/widgets/fields/custom_text_field.dart';

void main() {
  testWidgets('CustomTextField renders with correct values', (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextField(
            hintText: 'Hint Text',
            labelText: 'Label Text',
            prefixIcon: Icons.search,
            controller: controller,
          ),
        ),
      ),
    );

    expect(find.text('Hint Text'), findsOneWidget);
    expect(find.text('Label Text'), findsOneWidget);

    expect(controller.text, '');
  });

  testWidgets('CustomTextField allows typing and clears text', (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextField(
            hintText: 'Enter text',
            labelText: 'Text Field',
            prefixIcon: Icons.search,
            controller: controller,
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'Test input');
    await tester.pump();

    expect(controller.text, 'Test input');

    await tester.tap(find.byIcon(Icons.clear));
    await tester.pump();

    expect(controller.text, '');
  });

  testWidgets('CustomTextField is disabled when enabled is false', (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextField(
            hintText: 'Enter text',
            labelText: 'Text Field',
            prefixIcon: Icons.search,
            controller: controller,
            enabled: false,
          ),
        ),
      ),
    );

    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.enabled, false);
  });
}
