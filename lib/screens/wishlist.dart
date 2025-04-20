import 'package:flutter/material.dart';
import '../theme.dart';
import '../utils/navigation.dart';
import '../widgets/main_scaffold.dart';
import '../models/wishlist_item.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  List<WishlistItem> items = [
    WishlistItem(
      type: "T-shirt",
      color: "Pink",
      weather: "Warm",
      price: 35,
      image: "assets/shirt1.png",
    ),
    WishlistItem(
      type: "Jeans",
      color: "Blue",
      weather: "Any",
      price: 70,
      image: "assets/pants1.png",
    ),
    WishlistItem(
      type: "Scarf",
      color: "Yellow",
      weather: "Cold",
      price: 20,
      image: "assets/accessory1.png",
    ),
  ];

  void removeItem(int index) {
    final removedItem = items[index];
    setState(() {
      items.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Item removed! 🗑️"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              items.insert(index, removedItem);
            });
          },
        ),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 3,
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
          title: const Text("Wishlist", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: items.isEmpty
            ? const Center(child: Text("Your wishlist is empty! 🫠"))
            : ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(item.image, height: 60),
                ),
                title: Text(item.type),
                subtitle: Text(
                    "${item.color} · ${item.weather} weather · \$${item.price}"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: () => removeItem(index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}