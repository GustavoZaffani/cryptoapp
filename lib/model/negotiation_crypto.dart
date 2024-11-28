import 'package:json_annotation/json_annotation.dart';

part 'negotiation_crypto.g.dart';

@JsonSerializable()
class NegotiationCrypto {
  final String id;
  final Crypto crypto;
  final String type;
  final double value;
  final double quantity;

  NegotiationCrypto({
    required this.id,
    required this.crypto,
    required this.type,
    required this.value,
    required this.quantity,
  });

  factory NegotiationCrypto.fromJson(Map<String, dynamic> json) =>
      _$NegotiationCryptoFromJson(json);

  Map<String, dynamic> toJson() => _$NegotiationCryptoToJson(this);
}

@JsonSerializable()
class Crypto {
  final String id;
  final String name;
  final String symbol;

  Crypto({
    required this.id,
    required this.name,
    required this.symbol,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) =>
      _$CryptoFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoToJson(this);
}
