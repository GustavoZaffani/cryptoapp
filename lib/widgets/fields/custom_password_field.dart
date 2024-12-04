import 'package:cryptoapp/widgets/fields/custom_field.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.enabled = true,
    this.validator,
  });

  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final bool? enabled;
  final String? Function(String?)? validator;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _secureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomField(
      enabled: widget.enabled,
      validator: widget.validator,
      keyboardType: TextInputType.text,
      hintText: widget.hintText,
      labelText: widget.labelText,
      prefixIcon: Icons.lock_outline,
      suffixIcon: _secureText ? Icons.visibility_off : Icons.visibility,
      controller: widget.controller,
      isObscureText: _secureText,
      onPressed: () => setState(() {
        _secureText = !_secureText;
      }),
    );
  }
}
