import 'package:flutter/material.dart';
import '../widgets/main_scaffold.dart';
import '../theme.dart';

class BirthdatePickerField extends StatefulWidget {
  final TextEditingController controller;

  const BirthdatePickerField({super.key, required this.controller});

  @override
  State<BirthdatePickerField> createState() => _BirthdatePickerFieldState();
}

class _BirthdatePickerFieldState extends State<BirthdatePickerField> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: screenWidth * 0.85,
        child: TextFormField(
          controller: widget.controller,
          readOnly: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Birthdate (DD MM YYYY)",
            suffixIcon: Icon(Icons.calendar_today),
          ),
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime(2000),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );

            if (picked != null) {
              final formatted = "${picked.day.toString().padLeft(2, '0')} "
                  "${picked.month.toString().padLeft(2, '0')} "
                  "${picked.year}";
              widget.controller.text = formatted;
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Birthdate cannot be empty.';
            }

            final parts = value.split(' ');
            if (parts.length != 3) {
              return 'Please use DD MM YYYY format.';
            }

            try {
              final day = int.parse(parts[0]);
              final month = int.parse(parts[1]);
              final year = int.parse(parts[2]);
              final date = DateTime(year, month, day);

              if (date.isAfter(DateTime.now())) {
                return 'You cannot be born in the future.';
              }
            } catch (_) {
              return 'Invalid date!';
            }

            return null;
          },
        ),
      ),
    );
  }
}

