import 'package:flutter/material.dart';

class Alerts {
  static void showSuccessDialog({
    required BuildContext context,
    required String message,
    required VoidCallback onConfirmPressed,
  }) {
    showAlertDialog(
      context: context,
      icon: Icons.check_circle,
      color: Colors.green,
      title: "Sucesso!",
      message: message,
      onConfirmPressed: onConfirmPressed,
    );
  }

  static void showInfoDialog({
    required BuildContext context,
    required String title,
    required String message
  }) {
    showAlertDialog(
      context: context,
      icon: Icons.check_circle,
      color: Colors.blue,
      title: title,
      message: message
    );
  }

  static void showErrorDialog({
    required BuildContext context,
    required String message,
  }) {
    showAlertDialog(
      context: context,
      icon: Icons.error,
      color: Colors.red,
      title: "Ops... ",
      message: message,
    );
  }

  static void showUnexpectedErrorDialog({
    required BuildContext context,
    required String message,
  }) {
    showAlertDialog(
      context: context,
      icon: Icons.error,
      color: Colors.red,
      title: "Ops... ",
      message: "Ocorreu um erro inesperado. Error: $message",
    );
  }

  static void showAlertDialog({
    required BuildContext context,
    required IconData icon,
    required Color color,
    required String title,
    required String message,
    VoidCallback? onConfirmPressed,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Icon(icon),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: color,
              width: 2,
            ),
          ),
          iconColor: color,
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onConfirmPressed?.call();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
