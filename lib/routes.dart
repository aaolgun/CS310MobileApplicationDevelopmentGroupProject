import 'package:flutter/material.dart';

// 🧭 Import all screens
import 'screens/welcome.dart';
import 'screens/login.dart';
import 'screens/create_account.dart';
import 'screens/weather.dart';
import 'screens/closet.dart';
import 'screens/add_item.dart';
import 'screens/profile.dart';
import 'screens/settings.dart';
import 'screens/wishlist.dart';
import 'screens/add_wishlist.dart';
import 'screens/looks.dart';
import 'screens/new_look.dart';

final Map<String, WidgetBuilder> appRoutes = {
  "/welcome": (context) => const Welcome(),
  "/login": (context) => const Login(),
  "/createaccount": (context) => const CreateAccount(),
  "/weather": (context) => const Weather(),
  "/closet": (context) => const Closet(),
  "/additem": (context) => const AddItem(),
  "/profile": (context) => const ProfilePage(),
  "/settings": (context) => const AccountSettingsPage(),
  "/wishlist": (context) => const Wishlist(),
  "/addwishlist": (context) => const AddWishlist(),
  "/looks": (context) => const Looks(),
  "/newlook": (context) => const NewLook(),
};
