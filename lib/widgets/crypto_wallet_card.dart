import 'package:flutter/material.dart';

class CryptoWalletCard extends StatelessWidget {
  const CryptoWalletCard({
    super.key,
    required this.name,
    required this.symbol,
    required this.quantity,
    required this.walletValue,
    required this.currentValue,
    required this.profitOrLossPercentage,
  });

  final String name;
  final String symbol;
  final double quantity;
  final double walletValue;
  final double currentValue;
  final double profitOrLossPercentage;

  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = Theme.of(context).colorScheme;
    Color profitColor = profitOrLossPercentage >= 0 ? defaultColorScheme.primary : defaultColorScheme.error;
    IconData iconData = profitOrLossPercentage >= 0 ? Icons.arrow_upward : Icons.arrow_downward;

    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$name ($symbol)',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Icon(
                  iconData,
                  color: profitColor,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Quantidade: ${quantity.toString()}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 10),
            Text(
              'Preço de Compra: R\$ ${walletValue.toStringAsFixed(8)}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 10),
            Text(
              'Preço Atual: R\$ ${currentValue.toStringAsFixed(8)}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 10),
            Text(
              'Lucro/Prejuízo: ${profitOrLossPercentage.toStringAsFixed(2)}%',
              style: TextStyle(
                color: profitColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
