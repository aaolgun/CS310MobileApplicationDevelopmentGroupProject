import 'package:flutter/material.dart';
import '../widgets/main_scaffold.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    final double sidePadding = MediaQuery.of(context).size.width * 0.075;

    return MainScaffold(
      currentIndex: 0,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(89, 115, 255, 1),
              Color.fromRGBO(22, 241, 255, 1),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "It’s a sunny day today at...",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Sabancı University",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        "19°",
                        style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _weatherMetric("HIGH", "24"),
                    _weatherMetric("LOW", "17"),
                    _weatherMetric("RAIN", "0%"),
                    _weatherMetric("UV", "5"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _forecastColumn("10", "sun.png", "20°"),
                    _forecastColumn("13", "sun.png", "21°"),
                    _forecastColumn("24", "sun.png", "24°"),
                    _forecastColumn("19", "moon.png", "20°"),
                    _forecastColumn("22", "moon.png", "17°"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.only(left: sidePadding),
                child: const Text(
                  "RECOMMENDED CLOTHING",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 125,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: sidePadding),
                    child: Row(
                      children: [
                        _clothingItem("shorts.png"),
                        _clothingItem("glasses.png"),
                        _clothingItem("shirt.png"),
                        _clothingItem("accessory1.png"),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              Padding(
                padding: EdgeInsets.only(left: sidePadding, bottom: 8),
                child: const Text(
                  "SWITCH LOCATION",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),

              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(255, 255, 255, 0.3),
                      hintText: "Search a new location",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              // network image block with ducky
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sidePadding),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1621524814002-04b2b9c58747?q=80&w=3873&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return SizedBox(
                        height: 180,
                        child: Center(child: CircularProgressIndicator(color: Colors.white)),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                        height: 180,
                        child: Center(
                          child: Text("Couldn't load the image 🫠", style: TextStyle(color: Colors.white)),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _forecastColumn(String time, String icon, String temp) {
    return Column(
      children: [
        Text(time, style: const TextStyle(fontSize: 20, color: Colors.white)),
        const SizedBox(height: 5),
        Image.asset("assets/$icon", height: 60),
        const SizedBox(height: 5),
        Text(temp, style: const TextStyle(fontSize: 20, color: Colors.white)),
      ],
    );
  }

  Widget _clothingItem(String assetName) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset("assets/$assetName", fit: BoxFit.cover),
      ),
    );
  }
}

Widget _weatherMetric(String label, String value) {
  return Container(
    width: 70,
    height: 70,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.3),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(value, style: TextStyle(color: Colors.white, fontSize: 24)),
      ],
    ),
  );
}
