import 'package:json_annotation/json_annotation.dart';

part 'wallet.g.dart';

@JsonSerializable()
class Wallet {
  final List<CryptoWallet> cryptos;

  Wallet({
    required this.cryptos,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) =>
      _$WalletFromJson(json);

  Map<String, dynamic> toJson() => _$WalletToJson(this);
}

@JsonSerializable()
class CryptoWallet {
  final String id;
  final String name;
  final String symbol;
  final double quantity;
  final double walletPrice;
  final double currentPrice;
  final double profitOrLossPercentage;

  CryptoWallet({
    required this.id,
    required this.name,
    required this.symbol,
    required this.quantity,
    required this.walletPrice,
    required this.currentPrice,
    required this.profitOrLossPercentage,
  });

  factory CryptoWallet.fromJson(Map<String, dynamic> json) =>
      _$CryptoWalletFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoWalletToJson(this);
}