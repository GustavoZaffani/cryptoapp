import 'package:cryptoapp/widgets/fields/custom_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomPasswordField renders with correct values',
      (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomPasswordField(
            hintText: 'Digite a senha',
            labelText: 'Senha',
            controller: controller,
          ),
        ),
      ),
    );

    expect(find.text('Digite a senha'), findsOneWidget);
    expect(find.text('Senha'), findsOneWidget);
  });

  testWidgets('CustomPasswordField allows typing and toggles visibility',
      (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomPasswordField(
            hintText: 'Digite a senha',
            labelText: 'Senha',
            controller: controller,
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'senha123');
    await tester.pump();

    expect(controller.text, 'senha123');

    expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    expect(find.byIcon(Icons.visibility), findsNothing);

    await tester.tap(find.byIcon(Icons.visibility_off));
    await tester.pump();

    expect(find.byIcon(Icons.visibility), findsOneWidget);
    expect(find.byIcon(Icons.visibility_off), findsNothing);

    expect(find.text('senha123'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.visibility));
    await tester.pump();

    expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    expect(find.byIcon(Icons.visibility), findsNothing);
  });

  testWidgets('CustomPasswordField is disabled when enabled is false',
      (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomPasswordField(
            hintText: 'Digite a senha',
            labelText: 'Senha',
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
