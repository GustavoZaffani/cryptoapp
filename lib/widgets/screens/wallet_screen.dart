import 'package:cryptoapp/widgets/crypto_wallet_card.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Carteira", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: mockWallet(),
        ),
      ),
    );
  }
}

List<Widget> mockWallet() {
  return [
    CryptoWalletCard(
      name: 'Litecoin',
      symbol: 'LTC',
      quantity: 3,
      averageCost: 50,
      walletValue: 150,
      profitOrLossPercentage: 200,
    ),
    CryptoWalletCard(
      name: 'Bitcoin',
      symbol: 'BTC',
      quantity: 0.5,
      averageCost: 45000,
      walletValue: 30000,
      profitOrLossPercentage: 50,
    ),
    CryptoWalletCard(
      name: 'Ethereum',
      symbol: 'ETH',
      quantity: 2,
      averageCost: 2500,
      walletValue: 2000,
      profitOrLossPercentage: 25,
    ),
    CryptoWalletCard(
      name: 'Ripple',
      symbol: 'XRP',
      quantity: 500,
      averageCost: 1.5,
      walletValue: 0.8,
      profitOrLossPercentage: 87.5,
    ),
    CryptoWalletCard(
      name: 'Bitcoin Cash',
      symbol: 'BCH',
      quantity: 1,
      averageCost: 700,
      walletValue: 600,
      profitOrLossPercentage: 16.67,
    ),
    CryptoWalletCard(
      name: 'Cardano',
      symbol: 'ADA',
      quantity: 1500,
      averageCost: 1.2,
      walletValue: 0.6,
      profitOrLossPercentage: 100,
    ),
    CryptoWalletCard(
      name: 'Solana',
      symbol: 'SOL',
      quantity: 4,
      averageCost: 150,
      walletValue: 120,
      profitOrLossPercentage: 25,
    ),
    CryptoWalletCard(
      name: 'Polkadot',
      symbol: 'DOT',
      quantity: 50,
      averageCost: 30,
      walletValue: 25,
      profitOrLossPercentage: 20,
    ),
    CryptoWalletCard(
      name: 'Dogecoin',
      symbol: 'DOGE',
      quantity: 1000,
      averageCost: 0.35,
      walletValue: 0.25,
      profitOrLossPercentage: 40,
    ),
    CryptoWalletCard(
      name: 'Shiba Inu',
      symbol: 'SHIB',
      quantity: 1000000,
      averageCost: 0.00001,
      walletValue: 0.000005,
      profitOrLossPercentage: 100,
    ),
    CryptoWalletCard(
      name: 'Chainlink',
      symbol: 'LINK',
      quantity: 10,
      averageCost: 30,
      walletValue: 25,
      profitOrLossPercentage: 20,
    ),
    CryptoWalletCard(
      name: 'Uniswap',
      symbol: 'UNI',
      quantity: 50,
      averageCost: 20,
      walletValue: 15,
      profitOrLossPercentage: 33.33,
    ),
    CryptoWalletCard(
      name: 'Aave',
      symbol: 'AAVE',
      quantity: 2,
      averageCost: 300,
      walletValue: 250,
      profitOrLossPercentage: 20,
    ),
    CryptoWalletCard(
      name: 'Litecoin',
      symbol: 'LTC',
      quantity: 10,
      averageCost: 100,
      walletValue: 80,
      profitOrLossPercentage: 25,
    ),
    CryptoWalletCard(
      name: 'Avalanche',
      symbol: 'AVAX',
      quantity: 5,
      averageCost: 120,
      walletValue: 100,
      profitOrLossPercentage: 20,
    ),
  ];
}
