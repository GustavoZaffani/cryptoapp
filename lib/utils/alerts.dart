import 'package:flutter/material.dart';

class Alerts {
  static void showErrorDialog(
      BuildContext context, String message) {
    showAlertDialog(
      context,
      Icons.error,
      Colors.red,
      "Ops... ",
      message,
    );
  }

  static void showUnexpectedErrorDialog(
      BuildContext context, String message) {
    showAlertDialog(
      context,
      Icons.error,
      Colors.red,
      "Ops... ",
      "Ocorreu um erro inesperado. Error: $message",
    );
  }

  static void showAlertDialog(
    BuildContext context,
    IconData icon,
    Color color,
    String title,
    String message,
  ) {
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
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
