import 'package:cryptoapp/controllers/sign_up_controller.dart';
import 'package:cryptoapp/utils/alerts.dart';
import 'package:cryptoapp/widgets/commons/loading.dart';
import 'package:cryptoapp/widgets/fields/custom_password_field.dart';
import 'package:cryptoapp/widgets/fields/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SignUpController _signUpController = SignUpController();
  final _formKey = GlobalKey<FormState>();

  bool _showLoader = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text(
            "Bem-vindo, faça seu cadastro",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: _getWidget());
  }

  Widget _signUpBody() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            CustomTextField(
              hintText: "Insira seu nome",
              labelText: "Nome",
              prefixIcon: Icons.person,
              controller: _nameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Campo obrigatório";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Insira seu email",
              labelText: "Email",
              prefixIcon: Icons.mail,
              controller: _emailController,
              validator: (value) {
                if (value!.isEmpty) {
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
                if (value!.isEmpty) {
                  return "Campo obrigatório";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _signUpController.createUser(
                    name: _nameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                    onSuccess: (data) => Alerts.showSuccessDialog(
                        context: context,
                        message: "Usuário registrado com sucesso. Faça o login",
                        onConfirmPressed: () => Navigator.pop(context)),
                    onError: (error) => Alerts.showErrorDialog(
                      context: context,
                      message: error,
                    ),
                    onLoading: () => setState(() => _showLoader = true),
                    onFinally: () => setState(() => _showLoader = false),
                  );
                }
              },
              child: const Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getWidget() {
    if (_showLoader) {
      return const Loading();
    } else {
      return _signUpBody();
    }
  }
}
