import 'package:cryptoapp/controllers/negotiation_crypto_controller.dart';
import 'package:cryptoapp/widgets/commons/empty_state.dart';
import 'package:cryptoapp/widgets/commons/error_state.dart';
import 'package:cryptoapp/widgets/commons/loading.dart';
import 'package:cryptoapp/widgets/transaction_card.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final NegotiationCryptoController _negotiationCryptoController =
      NegotiationCryptoController();

  List<Widget> _transactions = [];
  bool _showLoader = false;
  bool _hasError = false;
  bool _isEmpty = false;

  @override
  void initState() {
    super.initState();
    _fetchTransactions();
  }

  Future<void> _fetchTransactions() async {
    setState(() {
      _hasError = false;
    });

    await _negotiationCryptoController.listNegotiationCrypto(
      onSuccess: (data) {
        setState(() {
          _isEmpty = data.isEmpty;
          _transactions = data
              .map((transaction) => TransactionCard(
                    type: transaction.type,
                    value: transaction.value,
                    quantity: transaction.quantity,
                    cryptoName: transaction.crypto.name,
                    cryptoSymbol: transaction.crypto.symbol,
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
        title: const Text("Transações", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchTransactions,
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
        message: 'Erro ao carregar as transações',
      );
    } else if (_isEmpty) {
      return const EmptyStateWidget(
        message: "Nenhuma transação encontrada",
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: _transactions,
        ),
      );
    }
  }
}
