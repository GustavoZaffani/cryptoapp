import 'package:cryptoapp/widgets/crypto_wallet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CryptoWalletCard displays correct data and color for profit',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CryptoWalletCard(
            name: 'Bitcoin',
            symbol: 'BTC',
            quantity: 0.5,
            walletValue: 20000.0,
            currentValue: 25000.0,
            profitOrLossPercentage: 25.0,
          ),
        ),
      ),
    );

    expect(find.text('Bitcoin (BTC)'), findsOneWidget);
    expect(find.text('Quantidade: 0.5'), findsOneWidget);
    expect(find.text('Preço de Compra: 20000.0'), findsOneWidget);
    expect(find.text('Preço Atual: 25000.0'), findsOneWidget);
    expect(find.text('Lucro/Prejuízo: 25.00%'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_upward), findsOneWidget);

    final icon = tester.widget<Icon>(find.byIcon(Icons.arrow_upward));
    expect(
        icon.color,
        equals(Theme.of(tester.element(find.byType(CryptoWalletCard)))
            .colorScheme
            .primary));
  });

  testWidgets('CryptoWalletCard displays correct data and color for loss',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CryptoWalletCard(
            name: 'Ethereum',
            symbol: 'ETH',
            quantity: 1.0,
            walletValue: 3000.0,
            currentValue: 2500.0,
            profitOrLossPercentage: -16.67,
          ),
        ),
      ),
    );

    expect(find.text('Ethereum (ETH)'), findsOneWidget);
    expect(find.text('Quantidade: 1.0'), findsOneWidget);
    expect(find.text('Preço de Compra: 3000.0'), findsOneWidget);
    expect(find.text('Preço Atual: 2500.0'), findsOneWidget);
    expect(find.text('Lucro/Prejuízo: -16.67%'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_upward), findsOneWidget);

    final icon = tester.widget<Icon>(find.byIcon(Icons.arrow_upward));
    expect(
        icon.color,
        equals(Theme.of(tester.element(find.byType(CryptoWalletCard)))
            .colorScheme
            .error));
  });
}
