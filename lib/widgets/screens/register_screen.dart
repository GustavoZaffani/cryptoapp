import 'package:cryptoapp/widgets/fields/custom_password_field.dart';
import 'package:cryptoapp/widgets/fields/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Cadastro", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            CustomTextField(
              hintText: "Insira seu nome",
              labelText: "Nome",
              prefixIcon: Icons.person,
              controller: _nameController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Insira seu email",
              labelText: "Email",
              prefixIcon: Icons.mail,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomPasswordField(
              hintText: "Insira sua senha",
              labelText: "Senha",
              controller: _passwordController,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
