import 'package:cryptoapp/controllers/decice_info_controller.dart';
import 'package:cryptoapp/controllers/login_controller.dart';
import 'package:cryptoapp/main.dart';
import 'package:cryptoapp/utils/alerts.dart';
import 'package:cryptoapp/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final LoginController loginController = LoginController();
  final DeviceInfoController deviceInfoController = DeviceInfoController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.deepPurple,
          title: const Text("Bem-vindo", style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                deviceInfoController.getDeviceInfo(
                  onSuccess: (info) {
                    Alerts.showInfoDialog(
                      context: context,
                      title: 'Informações do dispositivo',
                      message: info,
                    );
                  },
                  onError: (error) {
                    Alerts.showUnexpectedErrorDialog(
                      context: context,
                      message: error,
                    );
                  },
                  onLoading: () => print('Carregando informações...'),
                  onFinally: () => print('Finalizado'),
                );
              },
            )
          ],
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
          onPressed: () {
            loginController.logout(
              onSuccess: () =>
                  Navigator.pushReplacementNamed(context, loginRoute),
              onError: (error) => Alerts.showUnexpectedErrorDialog(
                context: context,
                message: error,
              ),
            );
          },
          backgroundColor: Colors.deepPurple,
          child: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      ),
    );
  }
}
