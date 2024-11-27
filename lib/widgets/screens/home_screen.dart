import 'package:cryptoapp/main.dart';
import 'package:cryptoapp/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Bem-vindo Zaffani",
            style: TextStyle(color: Colors.white)),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            MenuItem(
              title: 'Carteira',
              subtitle: 'Acompanhe seus investimentos',
              icon: Icons.wallet,
              route: walletRoute,
            ),
            MenuItem(
              title: 'Transações',
              subtitle: 'Veja suas compras e vendas',
              icon: Icons.compare_arrows,
              route: transactionsRoute,
            ),
            MenuItem(
              title: 'Mercado',
              subtitle: 'Acompanhe as cotações',
              icon: Icons.currency_bitcoin,
              route: marketRoute,
            ),
            MenuItem(
              title: 'Cadastro',
              subtitle: 'Configure sua conta',
              icon: Icons.settings,
              route: settingsRoute,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurple,
        child: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
