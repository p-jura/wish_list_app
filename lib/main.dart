import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wish_list_app/constants/theme_and_style.dart';
import 'package:wish_list_app/screens/authentication/authentication_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wish List App',
      theme: ThemeData(
        textTheme: defoultTextTheme,
        colorScheme: DefaultColorsPalette.defoultColorScheme,
      ),
      home: const AuthenticationScreen(),
    );
  }
}
