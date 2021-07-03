import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/auth_service.dart';
import 'package:lagu_app/Screens/AccountInfo/account_info.dart';
import 'package:lagu_app/Screens/HobbyUpdate/hobby_update.dart';
import 'package:lagu_app/Screens/Settings/components/settings_button.dart';
import 'package:lagu_app/components/horizontal_or_line.dart';

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
          HorizontalOrLine(height: 10.0, label: "User"),
          SettingsButton(
            title: 'Account Info',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AccountInfo()));
            },
          ),
          SettingsButton(
            title: 'Hobbies',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HobbyUpdate()));
            },
          ),
          SettingsButton(
            title: 'Languages',
            onPressed: () {},
          ),
          HorizontalOrLine(height: 10.0, label: "Other"),
          SettingsButton(
            title: 'Sign Out',
            onPressed: () {
              new AuthService().signOut();
            },
          )
        ],
      ),
    );
  }
}
