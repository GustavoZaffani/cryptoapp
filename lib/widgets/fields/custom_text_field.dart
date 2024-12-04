import 'package:cryptoapp/widgets/fields/custom_field.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
    required this.controller,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  final String hintText;
  final String labelText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool? enabled;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return CustomField(
      enabled: widget.enabled,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        hintText: widget.hintText,
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: Icons.clear,
        controller: widget.controller,
        onPressed: () => widget.controller.clear());
  }
}
