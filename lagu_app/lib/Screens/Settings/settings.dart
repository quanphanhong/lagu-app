import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/auth_service.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                new AuthService().signOut();
              },
              child: Text('Sign Out'))
        ],
      ),
    );
  }
}
