// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet _$WalletFromJson(Map<String, dynamic> json) => Wallet(
      cryptos: (json['cryptos'] as List<dynamic>)
          .map((e) => CryptoWallet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'cryptos': instance.cryptos,
    };

CryptoWallet _$CryptoWalletFromJson(Map<String, dynamic> json) => CryptoWallet(
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      walletPrice: (json['walletPrice'] as num).toDouble(),
      currentPrice: (json['currentPrice'] as num).toDouble(),
      profitOrLossPercentage:
          (json['profitOrLossPercentage'] as num).toDouble(),
    );

Map<String, dynamic> _$CryptoWalletToJson(CryptoWallet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'quantity': instance.quantity,
      'walletPrice': instance.walletPrice,
      'currentPrice': instance.currentPrice,
      'profitOrLossPercentage': instance.profitOrLossPercentage,
    };
