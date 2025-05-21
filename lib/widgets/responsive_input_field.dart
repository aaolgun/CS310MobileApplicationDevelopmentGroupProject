import 'package:flutter/material.dart';

class ResponsiveInputField extends StatelessWidget {
  final String hintText;
  final bool obscure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const ResponsiveInputField({
    super.key,
    required this.hintText,
    this.obscure = false,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: screenWidth * 0.85,
        child: TextFormField(
          controller: controller,
          obscureText: obscure,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(), // <<< This line ensures borders!
            enabledBorder: const OutlineInputBorder(), // default gray border
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent),
            ),
          ),
        ),
      ),
    );
  }
}
