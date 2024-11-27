import 'package:flutter/material.dart';

class CryptoWalletCard extends StatelessWidget {
  CryptoWalletCard({
    required this.name,
    required this.symbol,
    required this.quantity,
    required this.walletValue,
    required this.averageCost,
    required this.profitOrLossPercentage,
  });

  final String name;
  final String symbol;
  final double quantity;
  final double walletValue;
  final double averageCost;
  final double profitOrLossPercentage;

  @override
  Widget build(BuildContext context) {
    Color profitColor = profitOrLossPercentage >= 0 ? Colors.green : Colors.red;

    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho: Nome e Símbolo da Cripto
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
                  Icons.arrow_upward,
                  // Um ícone genérico de cripto, pode ser personalizado
                  color: profitColor,
                ),
              ],
            ),
            SizedBox(height: 10),
            // Quantidade da Cripto
            Text(
              'Quantidade: ${quantity.toString()}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 10),
            // Preço de Compra (Wallet Price)
            Text(
              'Preço de Compra: ${walletValue}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 10),
            // Preço Atual
            Text(
              'Preço Atual: ${averageCost}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 10),
            // Porcentagem de Lucro/Prejuízo
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
