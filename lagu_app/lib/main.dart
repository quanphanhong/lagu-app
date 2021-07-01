import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/auth_provider.dart';
import 'package:lagu_app/Controller/auth_service.dart';
import 'package:lagu_app/Screens/AccountInfo/account_info.dart';
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
      debugShowCheckedModeBanner: false,
      home: AccountInfo(),
    );
    /*return Provider(
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

class HomeController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomeController> {
  Widget renderingWidget;

  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;

    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          if (signedIn) {
            return StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(auth.getCurrentUID())
                    .snapshots(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  return (snapshot.data.exists) ? MenuScreen() : InfoUpdate();
                });
          } else
            return LoginScreen();
        }
        return LoginScreen();
      },
    );
  }
}
