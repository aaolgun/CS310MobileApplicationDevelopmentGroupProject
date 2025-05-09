import 'package:flutter/material.dart';
import 'theme.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      initialRoute: "/welcome",
      routes: appRoutes,
    );
  }
}


