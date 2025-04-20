import 'package:flutter/material.dart';
import '../widgets/responsive_input_field.dart';
import '../widgets/responsive_button.dart';
import '../theme.dart';
import '../utils/navigation.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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
              "Sign in",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  ResponsiveInputField(
                    hintText: "email@domain.com",
                    controller: _emailController,
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
                    controller: _passwordController,
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
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamedAndRemoveUntil(context, "/weather", (route) => false);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Invalid Form"),
                        content: const Text("Please fill in all fields correctly."),
                        actions: [
                          TextButton(
                            child: const Text("OK"),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
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