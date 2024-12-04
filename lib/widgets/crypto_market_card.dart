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
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  symbol.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildPriceInfo('Preço atual', currentPrice),
            const SizedBox(height: 8),
            _buildPriceInfo('Volume atual', currentVolume),
            const SizedBox(height: 8),
            _buildPriceChangeInfo('Change (1h)', percentChange1h),
            const SizedBox(height: 8),
            _buildPriceChangeInfo('Change (24h)', percentChange24h),
            const SizedBox(height: 8),
            _buildPriceChangeInfo('Change (7d)', percentChange7d),
            const SizedBox(height: 8),
            _buildPriceChangeInfo('Change (30d)', percentChange30d),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceInfo(String label, double value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        Text(
          '\$${value.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceChangeInfo(String label, double changePercent) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        Text(
          '${changePercent.toStringAsFixed(2)}%',
          style: TextStyle(
            fontSize: 14,
            color: changePercent >= 0 ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}
