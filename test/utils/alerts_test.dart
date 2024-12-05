import 'package:cryptoapp/utils/alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('showSuccessDialog displays success alert',
      (WidgetTester tester) async {
    bool onConfirmCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  Alerts.showSuccessDialog(
                    context: context,
                    message: 'Operação realizada com sucesso!',
                    onConfirmPressed: () {
                      onConfirmCalled = true;
                    },
                  );
                },
                child: const Text('Show Success Dialog'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Show Success Dialog'));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.check_circle), findsOneWidget);
    expect(find.text('Sucesso!'), findsOneWidget);
    expect(find.text('Operação realizada com sucesso!'), findsOneWidget);

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    expect(onConfirmCalled, true);
  });

  testWidgets('showErrorDialog displays error alert',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  Alerts.showErrorDialog(
                    context: context,
                    message: 'Ocorreu um erro!',
                  );
                },
                child: const Text('Show Error Dialog'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Show Error Dialog'));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.error), findsOneWidget);
    expect(find.text('Ops... '), findsOneWidget);
    expect(find.text('Ocorreu um erro!'), findsOneWidget);
  });

  testWidgets('showInfoDialog displays info alert',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  Alerts.showInfoDialog(
                    context: context,
                    title: 'Informações',
                    message: 'Aqui está uma informação importante.',
                  );
                },
                child: const Text('Show Info Dialog'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Show Info Dialog'));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.check_circle), findsOneWidget);
    expect(find.text('Informações'), findsOneWidget);
    expect(find.text('Aqui está uma informação importante.'), findsOneWidget);
  });

  testWidgets('showUnexpectedErrorDialog displays unexpected error alert',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  Alerts.showUnexpectedErrorDialog(
                    context: context,
                    message: 'Erro desconhecido.',
                  );
                },
                child: const Text('Show Unexpected Error Dialog'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Show Unexpected Error Dialog'));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.error), findsOneWidget);
    expect(find.text('Ops... '), findsOneWidget);
    expect(find.text('Ocorreu um erro inesperado. Error: Erro desconhecido.'),
        findsOneWidget);
  });
}
