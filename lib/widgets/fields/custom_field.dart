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
    return TextFormField(
      enabled: widget.enabled,
      validator: widget.validator,
      obscureText: widget.isObscureText,
      controller: widget.controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: IconButton(
          onPressed: widget.onPressed,
          icon: Icon(widget.suffixIcon),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          borderSide: BorderSide(
            color: Colors.deepPurple,
            width: 2,
          ),
        ),
      ),
    );
  }
}
