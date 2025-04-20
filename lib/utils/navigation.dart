import 'package:flutter/material.dart';

import '../screens/welcome.dart';
import '../screens/login.dart';
import '../screens/create_account.dart';
import '../screens/weather.dart';
import '../screens/closet.dart';
import '../screens/add_item.dart';
import '../screens/profile.dart';
import '../screens/settings.dart';
import '../screens/wishlist.dart';
import '../screens/add_wishlist.dart';
import '../screens/looks.dart';
import '../screens/new_look.dart';

void navigateBackToWeather(BuildContext context) {
  Navigator.of(context).push(PageRouteBuilder(
    pageBuilder: (_, __, ___) => const Weather(),
    transitionsBuilder: (_, animation, __, child) {
      const begin = Offset(-1.0, 0.0); // left-to-right
      const end = Offset.zero;
      const curve = Curves.easeOut;

      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  ));
}

void navigateToNamedForward(BuildContext context, String routeName) {
  Navigator.of(context).push(PageRouteBuilder(
    pageBuilder: (context, _, __) => _getRouteWidget(context, routeName),
    transitionsBuilder: (_, animation, __, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(position: animation.drive(tween), child: child);
    },
  ));
}

void navigateBack(BuildContext context, {String fallbackRoute = "/weather", Widget? fallbackWidget}) {
  if (Navigator.canPop(context)) {
    Navigator.pop(context);
  } else {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (_, __, ___) => fallbackWidget ?? _getRouteWidget(context, fallbackRoute),
      transitionsBuilder: (_, animation, __, child) {
        const begin = Offset(-1.0, 0.0); // slide from left
        const end = Offset.zero;
        const curve = Curves.easeOut;

        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    ));
  }
}

Widget _getRouteWidget(BuildContext context, String routeName) {
  final routeBuilders = {
    "/additem": () => const AddItem(),
    "/newlook": () => const NewLook(),
    "/wishlist": () => const Wishlist(),
    "/profile": () => const ProfilePage(),
    "/weather": () => const Weather(),
    "/addwishlist": () => const AddWishlist(),
    "/settings": () => const AccountSettingsPage(),
    "/looks": () => const Looks(),
    "/closet": () => const Closet(),
    "/welcome": () => const Welcome(),
    "/login": () => const Login(),
    // we can add more routes as needed
  };
  return routeBuilders[routeName]!();
}
