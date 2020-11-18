import 'package:dsrpt21_app/screens/final_screen.dart';
import 'package:flutter/material.dart';
import 'package:dsrpt21_app/screens/home_screen.dart';
import 'package:dsrpt21_app/screens/progress_screen.dart';
import 'package:dsrpt21_app/screens/final_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/progress_screen': (context) => ProgressScreen(),
        '/final_screen': (context) => FinalScreen()
      },
    );
  }
}
