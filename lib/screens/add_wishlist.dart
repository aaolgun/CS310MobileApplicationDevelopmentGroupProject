import 'package:flutter/material.dart';
import '../widgets/responsive_input_field.dart';
import '../widgets/responsive_button.dart';
import '../theme.dart';
import '../utils/navigation.dart';
import '../widgets/main_scaffold.dart';

class AddWishlist extends StatelessWidget {
  const AddWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 3,
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
            "New wishlist entry",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 40),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Center(
                child: SizedBox(
                  width: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    // Adjust the radius as needed
                    child: Image.asset("assets/beanie.png", fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(height: 30),
              const ResponsiveInputField(hintText: "Item type"),
              SizedBox(height: 20),
              const ResponsiveInputField(hintText: "Color"),
              SizedBox(height: 20),
              const ResponsiveInputField(hintText: "Weather"),
              SizedBox(height: 20),
              const ResponsiveInputField(hintText: "Price"),
              SizedBox(height: 20),
              ResponsiveButton(
                text: "Add item",
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}