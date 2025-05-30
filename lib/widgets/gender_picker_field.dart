import 'package:flutter/material.dart';
import 'responsive_input_field.dart';

class GenderPickerField extends StatefulWidget {
  final TextEditingController controller;

  const GenderPickerField({super.key, required this.controller});

  @override
  State<GenderPickerField> createState() => _GenderPickerFieldState();
}

class _GenderPickerFieldState extends State<GenderPickerField> {
  final List<String> _options = ["Female", "Male", "Prefer not to say"];
  String? _selected;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: screenWidth * 0.85,
        child: DropdownButtonFormField<String>(
          style: Theme.of(context).textTheme.bodyMedium,
          value: _selected,
          items: _options
              .map((option) => DropdownMenuItem(
            value: option,
            child: Text(option),
          ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _selected = value;
              widget.controller.text = value!;
            });
          },
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(),
            hintText: "Select your gender",
          ),
          validator: (value) =>
          value == null || value.isEmpty ? 'Please select a gender' : null,
        ),
      ),
    );
  }
}