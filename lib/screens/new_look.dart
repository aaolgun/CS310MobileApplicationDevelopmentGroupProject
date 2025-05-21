import 'package:flutter/material.dart';
import '../utils/navigation.dart';
import '../widgets/responsive_input_field.dart';
import '../widgets/responsive_button.dart';
import '../widgets/main_scaffold.dart';
import 'looks.dart';

class NewLook extends StatelessWidget {
  const NewLook({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 1,
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
                  navigateBack(context, fallbackWidget: const Looks());
                },
              ),
            ],
          ),
          title: const Text(
            "Create new look",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.only(left: 30, bottom: 10),
                  child: Text(
                    "Recommended clothing based on your location. Click to add.",
                    style: TextStyle(
                      color: Color.fromRGBO(65, 65, 65, 1),
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 30),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          // Adjust the radius as needed
                          child: Image.asset("assets/shorts.png", fit: BoxFit.cover),
                        ),
                        SizedBox(width: 30),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          // Adjust the radius as needed
                          child: Image.asset("assets/glasses.png", fit: BoxFit.cover),
                        ),
                        SizedBox(width: 30),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          // Adjust the radius as needed
                          child: Image.asset("assets/shirt.png", fit: BoxFit.cover),
                        ),
                        SizedBox(width: 30),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  margin: EdgeInsets.only(left: 30, bottom: 10),
                  child: Text(
                    "Or, browse the entire closet if you wish.",
                    style: TextStyle(
                      color: Color.fromRGBO(65, 65, 65, 1),
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 30),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          // Adjust the radius as needed
                          child: Image.asset("assets/pants1.png", fit: BoxFit.cover),
                        ),
                        SizedBox(width: 30),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          // Adjust the radius as needed
                          child: Image.asset("assets/pants2.png", fit: BoxFit.cover),
                        ),
                        SizedBox(width: 30),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          // Adjust the radius as needed
                          child: Image.asset("assets/pants3.png", fit: BoxFit.cover),
                        ),
                        SizedBox(width: 30),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Column(
                  children: [
                    Center(
                        child: const ResponsiveInputField(hintText: "Look name")
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: const ResponsiveInputField(hintText: "Style"),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: const ResponsiveInputField(hintText: "Weather"),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child:
                      ResponsiveButton(
                        text: "Create and save look",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}