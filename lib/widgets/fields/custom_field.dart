import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  const CustomField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.controller,
    required this.onPressed,
    required this.keyboardType,
    this.enabled = true,
    this.isObscureText = false,
    this.validator,
  });

  final String hintText;
  final String labelText;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final TextEditingController controller;
  final VoidCallback onPressed;
  final TextInputType keyboardType;
  final bool isObscureText;
  final bool? enabled;
  final String? Function(String?)? validator;

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      enabled: widget.enabled,
      validator: widget.validator,
      obscureText: widget.isObscureText,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: defaultColorScheme.onSurfaceVariant,
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: defaultColorScheme.onSurface,
          fontSize: 16,
        ),
        prefixIcon:
            Icon(widget.prefixIcon, color: defaultColorScheme.onSurface),
        suffixIcon: IconButton(
          onPressed: widget.onPressed,
          icon: Icon(widget.suffixIcon, color: defaultColorScheme.onSurface),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: defaultColorScheme.outline,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          borderSide: BorderSide(
            color: defaultColorScheme.primary,
            width: 2,
          ),
        ),
      ),
    );
  }
}
