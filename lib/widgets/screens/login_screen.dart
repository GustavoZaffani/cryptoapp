import 'package:cryptoapp/controllers/login_controller.dart';
import 'package:cryptoapp/main.dart';
import 'package:cryptoapp/model/login.dart';
import 'package:cryptoapp/utils/alerts.dart';
import 'package:cryptoapp/widgets/fields/custom_password_field.dart';
import 'package:cryptoapp/widgets/fields/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController loginController = LoginController();
  final _formKey = GlobalKey<FormState>();

  bool _showLoader = false;
  bool _isPreviousLogged = false;

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    await loginController.getCurrentAuthentication(
      onSuccess: (data) {
        if (data != null) {
          _emailController.text = data.emailLogged;
          _isPreviousLogged = true;
        }
      },
      onError: (error) => Alerts.showUnexpectedErrorDialog(
        context: context,
        message: error,
      ),
      onLoading: () => setState(() => _showLoader = true),
      onFinally: () => setState(() => _showLoader = false),
    );
  }

  void _onLogged(String userId) {
    if (userId.isNotEmpty) {
      if (!_isPreviousLogged) {
        loginController.insertAuthentication(
          userId: userId,
          currentEmail: _emailController.text,
          onSuccess: (data) => Navigator.pushNamed(context, homeRoute),
          onError: (error) => Alerts.showUnexpectedErrorDialog(
            context: context,
            message: error,
          ),
          onLoading: () => setState(() => _showLoader = true),
          onFinally: () => setState(() => _showLoader = false),
        );
      } else {
        Navigator.pushNamed(context, homeRoute);
      }
    } else {
      Alerts.showErrorDialog(
        context: context,
        message: 'Email ou senha inválidos',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.supervised_user_circle_outlined, size: 100),
                const SizedBox(height: 16),
                if (_showLoader) const LinearProgressIndicator(),
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: "Insira seu email",
                  labelText: "Email",
                  prefixIcon: Icons.mail,
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo obrigatório";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomPasswordField(
                  hintText: "Insira sua senha",
                  labelText: "Senha",
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo obrigatório";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      loginController.login(
                        login: Login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                        onSuccess: (data) => _onLogged(data),
                        onError: (error) => Alerts.showUnexpectedErrorDialog(
                          context: context,
                          message: error,
                        ),
                        onFinally: () => setState(() => _showLoader = false),
                        onLoading: () => setState(() => _showLoader = true),
                      );
                    }
                  },
                  child: const Text("Login"),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, signUpRoute),
                  child: const Text("Não tem uma conta? Cadastre-se"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
