import 'package:flutter/material.dart';
import '../widgets/responsive_input_field.dart';
import '../widgets/responsive_button.dart';
import '../widgets/birthdate_picker_field.dart';
import '../widgets/gender_picker_field.dart';
import '../theme.dart';
import 'weather.dart';
import '../utils/navigation.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final _nameController = TextEditingController();
    final _birthdateController = TextEditingController();
    final _genderController = TextEditingController();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          children: [
            const SizedBox(height: 200),
            Center(child: Image.asset("assets/logo.png", height: 150)),
            const SizedBox(height: 50),
            const Text(
              "Create account",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  ResponsiveInputField(
                    hintText: "Name",
                    controller: _nameController,
                    validator: (value) =>
                    value == null || value.isEmpty ? 'Name cannot be empty.' : null,
                  ),
                  const SizedBox(height: 10),
                  BirthdatePickerField(controller: _birthdateController),
                  const SizedBox(height: 10),
                  GenderPickerField(controller: _genderController),
                  const SizedBox(height: 10),
                  ResponsiveInputField(
                    hintText: "email@domain.com",
                    controller: _emailController,
                    validator: (value) =>
                    value == null || !value.contains('@') ? 'Enter a valid email.' : null,
                  ),
                  const SizedBox(height: 10),
                  ResponsiveInputField(
                    hintText: "Password",
                    controller: _passwordController,
                    obscure: true,
                    validator: (value) =>
                    value == null || value.length < 6
                        ? 'Password must be at least 6 characters.'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  ResponsiveButton(
                    text: "Create account",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        navigateToNamedForward(context, "/weather");
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Invalid Form"),
                            content: const Text("Please fill in all fields correctly."),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("OK"),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
