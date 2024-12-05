import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cryptoapp/widgets/fields/custom_field.dart';

void main() {
  testWidgets('CustomField renders with correct values', (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomField(
            hintText: 'Digite algo',
            labelText: 'Campo de Texto',
            prefixIcon: Icons.search,
            suffixIcon: Icons.clear,
            controller: controller,
            onPressed: () => controller.clear(),
            keyboardType: TextInputType.text,
          ),
        ),
      ),
    );

    expect(find.text('Digite algo'), findsOneWidget);
    expect(find.text('Campo de Texto'), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.clear), findsOneWidget);
  });

  testWidgets('CustomField allows typing and clears text when suffix icon is tapped', (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomField(
            hintText: 'Digite algo',
            labelText: 'Campo de Texto',
            prefixIcon: Icons.search,
            suffixIcon: Icons.clear,
            controller: controller,
            onPressed: () => controller.clear(),
            keyboardType: TextInputType.text,
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField), 'Texto inserido');
    await tester.pump();

    expect(controller.text, 'Texto inserido');

    await tester.tap(find.byIcon(Icons.clear));
    await tester.pump();

    expect(controller.text, '');
  });

  testWidgets('CustomField is disabled when enabled is false', (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomField(
            hintText: 'Digite algo',
            labelText: 'Campo de Texto',
            prefixIcon: Icons.search,
            suffixIcon: Icons.clear,
            controller: controller,
            onPressed: () => controller.clear(),
            keyboardType: TextInputType.text,
            enabled: false,
          ),
        ),
      ),
    );

    final textFormField = tester.widget<TextFormField>(find.byType(TextFormField));
    expect(textFormField.enabled, false);
  });
}
