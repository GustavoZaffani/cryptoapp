import 'package:cryptoapp/widgets/screens/home_screen.dart';
import 'package:cryptoapp/widgets/screens/login_screen.dart';
import 'package:cryptoapp/widgets/screens/market_screen.dart';
import 'package:cryptoapp/widgets/screens/register_screen.dart';
import 'package:cryptoapp/widgets/screens/sign_up_screen.dart';
import 'package:cryptoapp/widgets/screens/transaction_screen.dart';
import 'package:cryptoapp/widgets/screens/wallet_screen.dart';
import 'package:flutter/material.dart';

const loginRoute = "/login";
const homeRoute = "/home";
const walletRoute = "/wallet";
const transactionsRoute = "/transactions";
const marketRoute = "/market";
const settingsRoute = "/settings";
const signUpRoute = "/signUp";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CryptoApp());
}

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CryptoApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: loginRoute,
      routes: {
        loginRoute: (context) => const LoginScreen(),
        homeRoute: (context) => HomeScreen(),
        walletRoute: (context) => const WalletScreen(),
        transactionsRoute: (context) => const TransactionList(),
        marketRoute: (context) => const MarketScreen(),
        settingsRoute: (context) => const RegisterScreen(),
        signUpRoute: (context) => const SignUpScreen(),
      },
    );
  }
}
