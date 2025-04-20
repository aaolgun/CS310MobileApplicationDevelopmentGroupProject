import 'package:flutter/material.dart';
import '../theme.dart';
import '../utils/navigation.dart';
import '../widgets/main_scaffold.dart';
import 'login.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                  navigateBackToWeather(context);
                },
              ),
            ],
          ),
          title: const Text("Profile", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 40),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage("profile_picture.png"),
              ),
              const SizedBox(height: 20),
              const Text(
                "John Doe",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                "john.doe@example.com",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              const Text("User since: January 2024"),
              const SizedBox(height: 30),
              const Text(
                "Saved Items",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 30),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset("assets/shirt.png", fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 30),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset("assets/pants1.png", fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 30),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset("assets/pants2.png", fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 30),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  navigateToNamedForward(context, "/settings");
                },
                child: const Text("Change Account Settings"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  navigateBack(context, fallbackWidget: const Login());
                },
                child: const Text("Log Out"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}