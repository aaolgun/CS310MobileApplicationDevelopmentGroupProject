import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stylecast/firebase_options.dart';

import 'theme.dart';
import 'routes.dart';

import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        theme: appTheme,
        initialRoute: "/welcome",
        routes: appRoutes,
      ),
    );

  }
}