
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String? hintText;
  final IconData icon;
  final FocusNode focusNode;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  const CustomTextFormField({
    super.key, 
    required this.label, 
    required this.icon, 
    this.keyboardType,
    this.hintText, 
    required this.focusNode, 
    this.validator, 
    this.onChanged, 
    this.onFieldSubmitted, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        focusNode: focusNode,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          label: label.isNotEmpty ? Text(label) : null,
          hintText: hintText,
          prefixIcon: Icon(icon),
        ),
        validator: validator,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        // onTapOutside: (event) => focusNode.unfocus,
      ),
    );
  }
}