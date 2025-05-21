import 'package:flutter/material.dart';
import '../widgets/responsive_input_field.dart';
import '../widgets/responsive_button.dart';
import '../widgets/birthdate_picker_field.dart';
import '../widgets/gender_picker_field.dart';
import '../utils/navigation.dart';

import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final nameController = TextEditingController();
    final birthdateController = TextEditingController();
    final genderController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

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
              key: formKey,
              child: Column(
                children: [
                  ResponsiveInputField(
                    hintText: "Name",
                    controller: nameController,
                    validator: (value) =>
                    value == null || value.isEmpty ? 'Name cannot be empty.' : null,
                  ),
                  const SizedBox(height: 10),
                  BirthdatePickerField(controller: birthdateController),
                  const SizedBox(height: 10),
                  GenderPickerField(controller: genderController),
                  const SizedBox(height: 10),
                  ResponsiveInputField(
                    hintText: "email@domain.com",
                    controller: emailController,
                    validator: (value) =>
                    value == null || !value.contains('@') ? 'Enter a valid email.' : null,
                  ),
                  const SizedBox(height: 10),
                  ResponsiveInputField(
                    hintText: "Password",
                    controller: passwordController,
                    obscure: true,
                    validator: (value) =>
                    value == null || value.length < 6
                        ? 'Password must be at least 6 characters.'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  ResponsiveButton(
                    text: "Create account",
                    onPressed: () async {
                      if (!formKey.currentState!.validate()) return;

                      try {
                        await context.read<AuthProvider>()
                            .signUp(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                        navigateToNamedForward(context, "/weather");
                      } catch (e) {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text("Please fill in all fields correctly."),
                            content: Text(e.toString()),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("OK"),
                              )
                            ],
                          ),
                        );
                      }
                    },
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
