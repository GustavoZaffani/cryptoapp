// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_market.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoMarket _$CryptoMarketFromJson(Map<String, dynamic> json) => CryptoMarket(
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      currentPrice: (json['currentPrice'] as num).toDouble(),
      currentVolume: (json['currentVolume'] as num).toDouble(),
      percentChange1h: (json['percentChange1h'] as num).toDouble(),
      percentChange24h: (json['percentChange24h'] as num).toDouble(),
      percentChange7d: (json['percentChange7d'] as num).toDouble(),
      percentChange30d: (json['percentChange30d'] as num).toDouble(),
    );

Map<String, dynamic> _$CryptoMarketToJson(CryptoMarket instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'currentPrice': instance.currentPrice,
      'currentVolume': instance.currentVolume,
      'percentChange1h': instance.percentChange1h,
      'percentChange24h': instance.percentChange24h,
      'percentChange7d': instance.percentChange7d,
      'percentChange30d': instance.percentChange30d,
    };
