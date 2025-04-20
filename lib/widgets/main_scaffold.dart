import 'package:flutter/material.dart';
import '../theme.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final int currentIndex;

  const MainScaffold({super.key, required this.body, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[400],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, "/weather");
              break;
            case 1:
              Navigator.pushReplacementNamed(context, "/looks");
              break;
            case 2:
              Navigator.pushReplacementNamed(context, "/closet");
              break;
            case 3:
              Navigator.pushReplacementNamed(context, "/wishlist");
              break;
            case 4:
              Navigator.pushReplacementNamed(context, "/profile");
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.checkroom_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
        ],
      ),
      body: body,
    );
  }
}