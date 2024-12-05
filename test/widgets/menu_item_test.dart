import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cryptoapp/widgets/menu_item.dart';

void main() {
  testWidgets('MenuItem renders with correct values', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MenuItem(
            title: 'Menu Item',
            subtitle: 'Subtitle',
            icon: Icons.home,
            route: '/home',
          ),
        ),
      ),
    );

    expect(find.text('Menu Item'), findsOneWidget);
    expect(find.text('Subtitle'), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
  });

  testWidgets('MenuItem navigates to the correct route on tap', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const Scaffold(
          body: MenuItem(
            title: 'Menu Item',
            subtitle: 'Subtitle',
            icon: Icons.home,
            route: '/home',
          ),
        ),
        routes: {
          '/home': (context) => const Text('Home Page'),
        },
      ),
    );

    expect(find.text('Menu Item'), findsOneWidget);

    await tester.tap(find.byType(MenuItem));
    await tester.pumpAndSettle();

    expect(find.text('Home Page'), findsOneWidget);
  });

  testWidgets('MenuItem has correct styling', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MenuItem(
            title: 'Menu Item',
            subtitle: 'Subtitle',
            icon: Icons.home,
            route: '/home',
          ),
        ),
      ),
    );

    final titleText = tester.widget<Text>(find.text('Menu Item'));
    expect(titleText.style?.fontSize, 20);
    expect(titleText.style?.fontWeight, FontWeight.bold);

    final subtitleText = tester.widget<Text>(find.text('Subtitle'));
    expect(subtitleText.style?.fontSize, 14);
  });
}
