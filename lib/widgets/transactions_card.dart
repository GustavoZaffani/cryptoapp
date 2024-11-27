// import 'package:flutter/material.dart';
//
// class Transaction {
//   final String id;
//   final String type; // 'buy' ou 'sell'
//   final double amount;
//   final DateTime date;
//   final String transactionName;
//
//   Transaction({
//     required this.id,
//     required this.type,
//     required this.amount,
//     required this.date,
//     required this.transactionName
//   });
// }
//
// class TransactionList extends StatelessWidget {
//   final List<Transaction> transactions;
//
//   const TransactionList({
//     Key? key,
//     required this.transactions,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: transactions.length,
//       itemBuilder: (context, index) {
//         final transaction = transactions[index];
//         return TransactionCard(
//           type: transaction.type,
//           amount: transaction.amount,
//           date: transaction.date,
//           transactionName: transaction.transactionName,
//         );
//       },
//     );
//   }
// }
//
// class TransactionCard extends StatelessWidget {
//   final String type;
//   final double amount;
//   final DateTime date;
//   final String transactionName;
//
//   const TransactionCard({
//     Key? key,
//     required this.type,
//     required this.amount,
//     required this.date,
//     required this.transactionName,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Formatação da data
//     String formattedDate = 'dd/MM/yyyy';
//
//     // Definindo a cor de fundo com base no tipo da transação
//     Color typeColor = type == 'buy' ? Colors.green : Colors.red;
//     IconData transactionIcon = type == 'buy' ? Icons.arrow_upward : Icons.arrow_downward;
//
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15), // Bordas arredondadas
//       ),
//       elevation: 8, // Sombra suave para dar um efeito de profundidade
//       shadowColor: Colors.black.withOpacity(0.3), // Cor da sombra
//       child: Padding(
//         padding: const EdgeInsets.all(16.0), // Padding interno
//         child: Row(
//           children: [
//             // Ícone da transação (seta)
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: typeColor.withOpacity(0.2), // Cor suave para o fundo do ícone
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 transactionIcon,
//                 color: typeColor,
//                 size: 30,
//               ),
//             ),
//             const SizedBox(width: 16), // Espaçamento entre ícone e o texto
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Nome da transação
//                   Text(
//                     transactionName,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 8), // Espaço entre nome e detalhes
//                   // Detalhes da transação
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Data da transação
//                       Text(
//                         'Data: $formattedDate',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                       // Valor da transação
//                       Text(
//                         'R\$ ${amount.toStringAsFixed(2)}',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: typeColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }