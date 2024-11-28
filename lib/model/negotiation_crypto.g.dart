// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'negotiation_crypto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NegotiationCrypto _$NegotiationCryptoFromJson(Map<String, dynamic> json) =>
    NegotiationCrypto(
      id: json['id'] as String,
      crypto: Crypto.fromJson(json['crypto'] as Map<String, dynamic>),
      type: json['type'] as String,
      value: (json['value'] as num).toDouble(),
      quantity: (json['quantity'] as num).toDouble(),
    );

Map<String, dynamic> _$NegotiationCryptoToJson(NegotiationCrypto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'crypto': instance.crypto,
      'type': instance.type,
      'value': instance.value,
      'quantity': instance.quantity,
    };

Crypto _$CryptoFromJson(Map<String, dynamic> json) => Crypto(
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
    );

Map<String, dynamic> _$CryptoToJson(Crypto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
    };
