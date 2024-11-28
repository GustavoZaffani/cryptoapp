import 'package:flutter/material.dart';

class ErrorState extends StatelessWidget {
  final String message;

  const ErrorState({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline, // Ícone de erro
              size: 80,
              color: Colors.red, // Cor vermelha para representar erro
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red[700], // Cor da mensagem de erro
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
