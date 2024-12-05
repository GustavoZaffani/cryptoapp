import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            strokeWidth: 4.0,
            valueColor: AlwaysStoppedAnimation<Color>(defaultColorScheme.primary),
          ),
          const SizedBox(height: 16),
          Text(
            'Carregando...',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: defaultColorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}