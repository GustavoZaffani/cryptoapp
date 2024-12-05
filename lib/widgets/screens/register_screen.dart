import 'package:cryptoapp/controllers/register_controller.dart';
import 'package:cryptoapp/model/user.dart';
import 'package:cryptoapp/utils/alerts.dart';
import 'package:cryptoapp/widgets/commons/error_state.dart';
import 'package:cryptoapp/widgets/commons/loading.dart';
import 'package:cryptoapp/widgets/fields/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final RegisterController _registerController = RegisterController();
  final _formKey = GlobalKey<FormState>();

  bool _showLoader = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchUser();
  }

  Future<void> _fetchUser() async {
    setState(() {
      _hasError = false;
    });

    await _registerController.retrieveUser(
      onSuccess: (User data) {
        setState(() {
          _nameController.text = data.name!;
          _emailController.text = data.email!;
        });
      },
      onError: (error) {
        setState(() {
          _hasError = true;
        });
      },
      onLoading: () => setState(() => _showLoader = true),
      onFinally: () => setState(() => _showLoader = false),
    );
  }

  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultColorScheme.primaryContainer,
        title: Text("Cadastro",
            style: TextStyle(color: defaultColorScheme.onPrimaryContainer)),
      ),
      body: _getWidget(),
    );
  }

  Widget _registerBody() {
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
                enabled: false,
                prefixIcon: Icons.mail,
                controller: _emailController),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _registerController.updateUser(
                    name: _nameController.text,
                    onSuccess: (data) => Alerts.showSuccessDialog(
                        context: context,
                        message: "Usuário atualizado com sucesso",
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
    } else if (_hasError) {
      return const ErrorState(
        message: 'Erro ao carregar a carteira',
      );
    } else {
      return _registerBody();
    }
  }
}
