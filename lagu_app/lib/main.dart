import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/auth_provider.dart';
import 'package:lagu_app/Controller/auth_service.dart';
import 'package:lagu_app/Screens/InfoUpdate/info_update.dart';
import 'package:lagu_app/Screens/Login/login_screen.dart';
import 'package:lagu_app/Screens/Menu/menu-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InfoUpdate(),
    );

    /*
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lagu App',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        home: HomeController(),
      ),
    );*/
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;

    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? MenuScreen() : LoginScreen();
        }
        return LoginScreen();
      },
    );
  }
}
