import 'package:flutter/material.dart';
import '../widgets/responsive_input_field.dart';
import '../widgets/responsive_button.dart';

import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
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
              "Sign in",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Form(
              key: formKey,
              child: Column(
                children: [
                  ResponsiveInputField(
                    hintText: "email@domain.com",
                    controller: emailController,
                    obscure: false,
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  ResponsiveInputField(
                    hintText: "Password",
                    controller: passwordController,
                    obscure: true,
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Password must be at least 6 characters long.';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ResponsiveButton(
              text: "Log in",
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;

                try {
                  await context.read<AuthProvider>()
                      .login(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/weather", (r) => false);
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
            const SizedBox(height: 10),
            const Text("----------or----------"),
            const SizedBox(height: 10),
            ResponsiveButton(
              text: "Create account",
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, "/createaccount", (route) => false);
              },
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}