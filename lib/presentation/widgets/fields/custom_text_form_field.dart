import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String? hintText;
  final IconData? icon;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String defaultValue; // Nuevo parámetro

  const CustomTextFormField({
    super.key,
    required this.label,
    this.icon,
    this.keyboardType,
    this.hintText,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.defaultValue = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        initialValue: defaultValue,
        focusNode: focusNode,
        keyboardType: keyboardType,
        inputFormatters: keyboardType == TextInputType.number
            ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
            : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          label: label.isNotEmpty ? Text(label) : null,
          hintText: hintText,
          prefixIcon: icon != null ? Icon(icon) : null,
        ),
        validator: validator,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
