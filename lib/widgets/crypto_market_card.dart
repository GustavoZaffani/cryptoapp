import 'package:flutter/material.dart';

class CryptoMarketCard extends StatelessWidget {
  const CryptoMarketCard({
    super.key,
    required this.name,
    required this.symbol,
    required this.currentPrice,
    required this.currentVolume,
    required this.percentChange1h,
    required this.percentChange24h,
    required this.percentChange7d,
    required this.percentChange30d,
  });

  final String name;
  final String symbol;
  final double currentPrice;
  final double currentVolume;
  final double percentChange1h;
  final double percentChange24h;
  final double percentChange7d;
  final double percentChange30d;

  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = Theme.of(context).colorScheme;

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
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: defaultColorScheme.onSurface,
                  ),
                ),
                Text(
                  symbol.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                    color: defaultColorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildPriceInfo(context, 'Preço atual', currentPrice),
            const SizedBox(height: 8),
            _buildPriceInfo(context, 'Volume atual', currentVolume),
            const SizedBox(height: 8),
            _buildPriceChangeInfo(context, 'Variação (1h)', percentChange1h),
            const SizedBox(height: 8),
            _buildPriceChangeInfo(context, 'Variação (24h)', percentChange24h),
            const SizedBox(height: 8),
            _buildPriceChangeInfo(context, 'Variação (7d)', percentChange7d),
            const SizedBox(height: 8),
            _buildPriceChangeInfo(context, 'Variação (30d)', percentChange30d),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceInfo(BuildContext context, String label, double value) {
    final defaultColorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: defaultColorScheme.onSurface,
          ),
        ),
        Text(
          'R\$ ${value.toStringAsFixed(8)}',
          style: TextStyle(
            fontSize: 14,
            color: defaultColorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceChangeInfo(BuildContext context, String label, double changePercent) {
    final defaultColorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: defaultColorScheme.onSurface,
          ),
        ),
        Text(
          '${changePercent.toStringAsFixed(2)}%',
          style: TextStyle(
            fontSize: 14,
            color: changePercent >= 0 ? defaultColorScheme.primary : defaultColorScheme.error,
          ),
        ),
      ],
    );
  }
}
