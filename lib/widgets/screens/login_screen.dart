import 'package:cryptoapp/controllers/login_controller.dart';
import 'package:cryptoapp/main.dart';
import 'package:cryptoapp/model/login.dart';
import 'package:cryptoapp/repositories/db_repository.dart';
import 'package:cryptoapp/source/remote/rest_client.dart';
import 'package:cryptoapp/utils/alerts.dart';
import 'package:cryptoapp/widgets/fields/custom_password_field.dart';
import 'package:cryptoapp/widgets/fields/custom_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final RestClient restClient = RestClient(Dio());
  final DbRepository dbRepository = DbRepositoryImpl();
  final LoginController loginController = LoginController();

  bool _showLoader = false;
  bool _isPreviousLogged = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    var authenticationData = await dbRepository.getCurrentAuthentication();

    if (authenticationData != null) {
      _emailController.text = authenticationData.emailLogged;
      _isPreviousLogged = true;
    }
  }

  void _onLogged(String userId) {
    if (userId.isNotEmpty) {
      if (!_isPreviousLogged) {
        loginController.insertAuthentication(
          userId: "a",
          currentEmail: _emailController.text,
          onSuccess: (data) => print("Inserido com sucesso"),
          onError: (error) => print("Erro ao inserir: $error"),
          onLoading: () => print("Carregando"),
          onFinally: () => print("Finalizado"),
        );
      }

      Navigator.pushNamed(context, homeRoute);
    } else {
      Alerts.showErrorDialog(context, 'Email ou senha inválidos');
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
                        onError: (error) =>
                            Alerts.showUnexpectedErrorDialog(context, error),
                        onFinally: () => setState(() => _showLoader = false),
                        onLoading: () => setState(() => _showLoader = true),
                      );
                    }
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
