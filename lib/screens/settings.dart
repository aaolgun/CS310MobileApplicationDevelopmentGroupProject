import 'package:flutter/material.dart';
import '../theme.dart';
import '../utils/navigation.dart';
import '../widgets/main_scaffold.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 4,
      body: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          leadingWidth: 100,
          toolbarHeight: 70,
          leading: Row(
            children: [
              SizedBox(width: 20),
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          title: const Text(
            "Account settings",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child:SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("profile_picture.png"),
                ),
                const SizedBox(height: 30),
                _buildTextField("Name"),
                _buildTextField("Surname"),
                _buildTextField("Birthdate"),
                _buildTextField("Gender"),
                _buildTextField("Email"),
                _buildTextField("Password", obscure: true),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Save New Settings"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}