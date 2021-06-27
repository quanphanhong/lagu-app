import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/Menu/menu-screen.dart';
import 'package:lagu_app/Screens/MessageList/message_list.dart';
import 'package:lagu_app/Screens/Messaging/messaging.dart';
import 'package:lagu_app/Screens/UserDetail/user-detail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lagu App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MenuScreen(),
    );
    */
    return MaterialApp(
      home: UserDetailScreen(),
    );
  }
}
