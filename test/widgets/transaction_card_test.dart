import 'package:cryptoapp/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TransactionCard displays correct data for BUY transaction',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TransactionCard(
            type: 'BUY',
            value: 100.50,
            quantity: 0.015,
            cryptoName: 'Bitcoin',
            cryptoSymbol: 'BTC',
          ),
        ),
      ),
    );

    expect(find.text('Bitcoin'), findsOneWidget);
    expect(find.text('0.01500000 BTC'), findsOneWidget);
    expect(find.text('R\$ 100.50'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_upward), findsOneWidget);

    final icon = tester.widget<Icon>(find.byIcon(Icons.arrow_upward));
    expect(
        icon.color,
        equals(Theme.of(tester.element(find.byType(TransactionCard)))
            .colorScheme
            .primary));
  });

  testWidgets('TransactionCard displays correct data for SELL transaction',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TransactionCard(
            type: 'SELL',
            value: 200.75,
            quantity: 0.025,
            cryptoName: 'Ethereum',
            cryptoSymbol: 'ETH',
          ),
        ),
      ),
    );

    expect(find.text('Ethereum'), findsOneWidget);
    expect(find.text('0.02500000 ETH'), findsOneWidget);
    expect(find.text('R\$ 200.75'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_downward), findsOneWidget);

    final icon = tester.widget<Icon>(find.byIcon(Icons.arrow_downward));
    expect(
        icon.color,
        equals(Theme.of(tester.element(find.byType(TransactionCard)))
            .colorScheme
            .error));
  });
}
