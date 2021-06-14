import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/Menu/menu-screen.dart';
import 'package:lagu_app/Screens/welcome/welcome-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lagu App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MenuScreen(),
    );
  }
}
