import 'package:cryptoapp/controllers/market_controller.dart';
import 'package:cryptoapp/widgets/commons/empty_state.dart';
import 'package:cryptoapp/widgets/commons/error_state.dart';
import 'package:cryptoapp/widgets/commons/loading.dart';
import 'package:cryptoapp/widgets/crypto_market_card.dart';
import 'package:flutter/material.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final MarketController _marketController = MarketController();

  List<Widget> _marketData = [];
  bool _showLoader = false;
  bool _hasError = false;
  bool _isEmpty = false;

  @override
  void initState() {
    super.initState();
    _fetchMarketData();
  }

  Future<void> _fetchMarketData() async {
    setState(() {
      _hasError = false;
    });

    await _marketController.listMarketData(
      onSuccess: (data) {
        setState(() {
          _isEmpty = data.isEmpty;
          _marketData = data
              .map((crypto) => CryptoMarketCard(
                    name: crypto.name,
                    symbol: crypto.symbol,
                    currentPrice: crypto.currentPrice,
                    currentVolume: crypto.currentVolume,
                    percentChange1h: crypto.percentChange1h,
                    percentChange24h: crypto.percentChange24h,
                    percentChange7d: crypto.percentChange7d,
                    percentChange30d: crypto.percentChange30d,
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Mercado", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchMarketData,
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
        message: 'Erro ao carregar os dados do mercado',
      );
    } else if (_isEmpty) {
      return const EmptyStateWidget(
        message: "Nenhum dado de mercado encontrado",
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: _marketData,
        ),
      );
    }
  }
}
