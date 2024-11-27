import 'package:cryptoapp/widgets/transaction_card.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Transações", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: mockTransactional(),
        ),
      ),
    );
  }
}

// TODO: mock provisorio até obter dados do servidor
List<Widget> mockTransactional() {
  return [
    const TransactionCard(
      type: 'buy',
      value: 100,
      quantity: 1,
      cryptoName: 'Bitcoin',
      cryptoSymbol: 'BTC',
    ),
    const TransactionCard(
      type: 'sale',
      value: 150,
      quantity: 2,
      cryptoName: 'Ethereum',
      cryptoSymbol: 'ETH',
    ),
    const TransactionCard(
      type: 'buy',
      value: 50,
      quantity: 3,
      cryptoName: 'Litecoin',
      cryptoSymbol: 'LTC',
    ),
    const TransactionCard(
      type: 'sale',
      value: 200,
      quantity: 1,
      cryptoName: 'Bitcoin',
      cryptoSymbol: 'BTC',
    ),
    const TransactionCard(
      type: 'buy',
      value: 120,
      quantity: 5,
      cryptoName: 'Ethereum',
      cryptoSymbol: 'ETH',
    ),
    const TransactionCard(
      type: 'sale',
      value: 300,
      quantity: 10,
      cryptoName: 'Litecoin',
      cryptoSymbol: 'LTC',
    ),
    const TransactionCard(
      type: 'buy',
      value: 250,
      quantity: 1,
      cryptoName: 'Bitcoin',
      cryptoSymbol: 'BTC',
    ),
    const TransactionCard(
      type: 'sale',
      value: 180,
      quantity: 4,
      cryptoName: 'Ethereum',
      cryptoSymbol: 'ETH',
    ),
    const TransactionCard(
      type: 'buy',
      value: 75,
      quantity: 2,
      cryptoName: 'Bitcoin',
      cryptoSymbol: 'BTC',
    ),
    const TransactionCard(
      type: 'sale',
      value: 100,
      quantity: 7,
      cryptoName: 'Litecoin',
      cryptoSymbol: 'LTC',
    ),
  ];
}
