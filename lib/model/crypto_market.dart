import 'package:json_annotation/json_annotation.dart';

part 'crypto_market.g.dart';

@JsonSerializable()
class CryptoMarket {
  final String id;
  final String name;
  final String symbol;
  final double currentPrice;
  final double currentVolume;
  final double percentChange1h;
  final double percentChange24h;
  final double percentChange7d;
  final double percentChange30d;

  CryptoMarket({
    required this.id,
    required this.name,
    required this.symbol,
    required this.currentPrice,
    required this.currentVolume,
    required this.percentChange1h,
    required this.percentChange24h,
    required this.percentChange7d,
    required this.percentChange30d,
  });

  factory CryptoMarket.fromJson(Map<String, dynamic> json) =>
      _$CryptoMarketFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoMarketToJson(this);
}