import 'package:flutter/material.dart';
import '../theme.dart';
import '../utils/navigation.dart';
import '../widgets/main_scaffold.dart';

class Closet extends StatelessWidget {
  const Closet({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 2,
      body: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          elevation: 0,
          toolbarHeight: 70,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                navigateBackToWeather(context);
              },
            ),
          ),
          title: const Text(
            "Closet",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  navigateToNamedForward(context, "/additem");
                },
              ),
            ),
          ],
        ),
        body: SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 30, bottom: 10),
                  child: Text(
                    "SHIRTS",
                    style: TextStyle(
                      color: Color.fromRGBO(65, 65, 65, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 175,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 30),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          // Adjust the radius as needed
                          child: Image.asset("assets/shirt1.png", fit: BoxFit.cover),
                        ),
                        SizedBox(width: 30),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          // Adjust the radius as needed
                          child: Image.asset("assets/shirt.png", fit: BoxFit.cover),
                        ),
                        SizedBox(width: 30),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          // Adjust the radius as needed
                          child: Image.asset("assets/shirt3.png", fit: BoxFit.cover),
                        ),
                        SizedBox(width: 30),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.only(left: 30, bottom: 10),
                  child: Text(
                    "PANTS",
                    style: TextStyle(
                      color: Color.fromRGBO(65, 65, 65, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 175,
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
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.only(left: 30, bottom: 10),
                  child: Text(
                    "SHORTS",
                    style: TextStyle(
                      color: Color.fromRGBO(65, 65, 65, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 175,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 30),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          // Adjust the radius as needed
                          child: Image.asset("assets/shorts1.png", fit: BoxFit.cover),
                        ),
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
                          child: Image.asset("assets/shorts3.png", fit: BoxFit.cover),
                        ),
                        SizedBox(width: 30),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.only(left: 30, bottom: 10),
                  child: Text(
                    "ACCESSORIES",
                    style: TextStyle(
                      color: Color.fromRGBO(65, 65, 65, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 175,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 30),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          // Adjust the radius as needed
                          child: Image.asset("assets/accessory1.png", fit: BoxFit.cover),
                        ),
                        SizedBox(width: 30),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          // Adjust the radius as needed
                          child: Image.asset("assets/beanie.png", fit: BoxFit.cover),
                        ),
                        SizedBox(width: 30),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          // Adjust the radius as needed
                          child: Image.asset("assets/glasses.png", fit: BoxFit.cover),
                        ),
                        SizedBox(width: 30),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 125),
              ],
            ),
          ),
        ),
      ),
    );
  }
}