
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String? hintText;
  final IconData icon;
  final TextInputType? keyboardType;
  const CustomTextFormField({
    super.key, 
    required this.label, 
    required this.icon, 
    this.keyboardType,
    this.hintText, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          label: label.isNotEmpty ? Text(label) : null,
          hintText: hintText,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}