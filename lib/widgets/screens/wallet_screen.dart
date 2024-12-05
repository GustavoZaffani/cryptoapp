import 'package:cryptoapp/controllers/wallet_controller.dart';
import 'package:cryptoapp/model/wallet.dart';
import 'package:cryptoapp/widgets/commons/empty_state.dart';
import 'package:cryptoapp/widgets/commons/error_state.dart';
import 'package:cryptoapp/widgets/commons/loading.dart';
import 'package:cryptoapp/widgets/crypto_wallet_card.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final WalletController _walletController = WalletController();

  List<Widget> _wallets = [];
  bool _showLoader = false;
  bool _hasError = false;
  bool _isEmpty = false;

  @override
  void initState() {
    super.initState();
    _fetchWallet();
  }

  Future<void> _fetchWallet() async {
    setState(() {
      _hasError = false;
    });

    await _walletController.retrieveWallet(
      onSuccess: (Wallet data) {
        setState(() {
          _isEmpty = data.cryptos.isEmpty;
          _wallets = data.cryptos
              .map((crypto) => CryptoWalletCard(
                    name: crypto.name,
                    symbol: crypto.symbol,
                    quantity: crypto.quantity,
                    currentValue: crypto.currentPrice,
                    walletValue: crypto.walletPrice,
                    profitOrLossPercentage: crypto.profitOrLossPercentage,
                  ))
              .toList();
        });
      },
      onError: (error) {
        setState(() {
          _hasError = true;
        });
      },
      onLoading: () => setState(() => _showLoader = true),
      onFinally: () => setState(() => _showLoader = false),
    );
  }

  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultColorScheme.primaryContainer,
        title: Text("Carteira", style: TextStyle(color: defaultColorScheme.onPrimaryContainer)),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: defaultColorScheme.onPrimaryContainer),
            onPressed: _fetchWallet,
          ),
        ],
      ),
      body: _getWidget(),
    );
  }

  Widget _getWidget() {
    if (_showLoader) {
      return const Loading();
    } else if (_hasError) {
      return const ErrorState(
        message: 'Erro ao carregar a carteira',
      );
    } else if (_isEmpty) {
      return const EmptyStateWidget(
        message: "Nenhuma carteira encontrada",
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: _wallets,
        ),
      );
    }
  }
}