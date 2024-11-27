// import 'package:cryptoapp/widgets/transactions_card.dart';
// import 'package:flutter/material.dart';
//
// Widget preview() {
//   return const Navigation();
// }
//
// class Navigation extends StatefulWidget {
//   const Navigation({super.key});
//
//   @override
//   State<Navigation> createState() => _NavigationState();
// }
//
// class _NavigationState extends State<Navigation> {
//   int currentPageIndex = 0;
//
//   void switchPage(int index) {
//     setState(() {
//       currentPageIndex = index;
//     });
//   }
//
//   static const List<Widget> _widgetsOptions = <Widget>[
//     Text('Carteira'),
//     Text('Transações'),
//     Text('Mercado'),
//     Text('Configurações'),
//   ];
//
//   final List<Transaction> transactions = [
//     Transaction(
//       id: '1',
//       type: 'buy',
//       amount: 1500.00,
//       date: DateTime(2024, 10, 15),
//       transactionName: 'Compra de Ações XYZ',
//     ),
//     Transaction(
//       id: '2',
//       type: 'sell',
//       amount: 850.00,
//       date: DateTime(2024, 10, 16),
//       transactionName: 'Venda de Ações ABC',
//     ),
//     Transaction(
//       id: '3',
//       type: 'buy',
//       amount: 250.00,
//       date: DateTime(2024, 10, 17),
//       transactionName: 'Compra de Criptomoeda',
//     ),
//     Transaction(
//       id: '4',
//       type: 'sell',
//       amount: 500.00,
//       date: DateTime(2024, 10, 18),
//       transactionName: 'Venda de Títulos',
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         title: _widgetsOptions.elementAt(currentPageIndex),
//         actions: [
//           IconButton(
//             onPressed: null, // TODO
//             icon: const Icon(Icons.refresh),
//           )
//         ],
//       ),
//       bottomNavigationBar: NavigationBar(
//         onDestinationSelected: switchPage,
//         indicatorColor: Colors.amber,
//         selectedIndex: currentPageIndex,
//         destinations: const <Widget>[
//           NavigationDestination(
//             icon: Icon(Icons.wallet),
//             label: 'Carteira',
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.compare_arrows),
//             label: 'Transações',
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.currency_bitcoin),
//             label: 'Mercado',
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.settings),
//             label: 'Configurações',
//           ),
//         ],
//       ),
//       body: <Widget>[
//         TransactionList(transactions: transactions),
//         TransactionList(transactions: transactions),
//         TransactionList(transactions: transactions),
//         TransactionList(transactions: transactions)
//       ][currentPageIndex],
//     );
//   }
// }
