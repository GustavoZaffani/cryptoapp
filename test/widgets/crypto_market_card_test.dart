import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cryptoapp/widgets/crypto_market_card.dart';

void main() {
  testWidgets('CryptoMarketCard displays correct data for market information', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CryptoMarketCard(
            name: 'Bitcoin',
            symbol: 'BTC',
            currentPrice: 50000.0,
            currentVolume: 1200.0,
            percentChange1h: 0.5,
            percentChange24h: -1.2,
            percentChange7d: 2.0,
            percentChange30d: 5.5,
          ),
        ),
      ),
    );

    expect(find.text('Bitcoin'), findsOneWidget);
    expect(find.text('BTC'), findsOneWidget);
    expect(find.text('Preço atual'), findsOneWidget);
    expect(find.text('\$50000.00'), findsOneWidget);
    expect(find.text('Volume atual'), findsOneWidget);
    expect(find.text('\$1200.00'), findsOneWidget);
    expect(find.text('Variação (1h)'), findsOneWidget);
    expect(find.text('0.50%'), findsOneWidget);
    expect(find.text('Variação (24h)'), findsOneWidget);
    expect(find.text('-1.20%'), findsOneWidget);
    expect(find.text('Variação (7d)'), findsOneWidget);
    expect(find.text('2.00%'), findsOneWidget);
    expect(find.text('Variação (30d)'), findsOneWidget);
    expect(find.text('5.50%'), findsOneWidget);
  });
}
