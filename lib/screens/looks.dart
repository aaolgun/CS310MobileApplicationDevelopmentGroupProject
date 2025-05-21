import 'package:flutter/material.dart';
import '../utils/navigation.dart';
import '../widgets/main_scaffold.dart';
import '../widgets/responsive_button.dart';

class Looks extends StatelessWidget {
  const Looks({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 0,
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
            "Saved looks",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  navigateToNamedForward(context, "/newlook");
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              buildLookItem(
                imagePaths: [
                  "assets/shirt1.png",
                  "assets/glasses.png",
                  "assets/pants1.png"
                ],
                title: "\"My fave look\"",
                itemCount: "5",
                weather: "Sunny",
                style: "Street",
                moreText: "+2",
              ),
              buildLookItem(
                imagePaths: [
                  "assets/shirt3.png",
                  "assets/beanie.png",
                  "assets/pants3.png"
                ],
                title: "\"Bayram özel\"",
                itemCount: "7",
                weather: "Multiple",
                style: "Multiple",
                moreText: "+4",
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    ResponsiveButton(
                      text: "Create new look",
                      onPressed: () {
                        navigateToNamedForward(context, "/newlook");
                      },
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoBlock(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }


  Widget buildLookItem({
    required List<String> imagePaths,
    required String title,
    required String itemCount,
    required String weather,
    required String style,
    required String moreText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: 2x2 grid (first 3 items + more)
          Column(
            children: [
              Row(
                children: [
                  buildItemImage(imagePaths[0]),
                  const SizedBox(width: 10),
                  buildItemImage(imagePaths[1]),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  buildItemImage(imagePaths[2]),
                  const SizedBox(width: 10),
                  buildItemPlaceholder(moreText),
                ],
              ),
            ],
          ),
          const SizedBox(width: 20),
          // Right: Texts
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(child: buildInfoBlock("Items", itemCount)),
                      const SizedBox(width: 1),
                      Expanded(child: buildInfoBlock("Weather", weather)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  buildInfoBlock("Style", style),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItemImage(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.asset(path, width: 60, height: 60, fit: BoxFit.cover),
    );
  }

  Widget buildItemPlaceholder(String text) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(200, 200, 200, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}