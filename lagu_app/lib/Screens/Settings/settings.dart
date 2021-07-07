import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/auth_service.dart';
import 'package:lagu_app/Screens/Settings/components/account_info_button.dart';
import 'package:lagu_app/Screens/Settings/components/hobby_update_button.dart';
import 'package:lagu_app/Screens/Settings/components/language_update_button.dart';
import 'package:lagu_app/Screens/Settings/components/sign_out_button.dart';
import 'package:lagu_app/Screens/Settings/setting_pages/LanguageUpdate/language_update.dart';

import 'setting_pages/AccountInfo/account_info.dart';
import 'setting_pages/HobbyUpdate/hobby_update.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AccountInfoButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AccountInfo()));
            },
          ),
          HobbyUpdateButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HobbyUpdate()));
            },
          ),
          LanguageUpdateButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LanguageUpdate()));
            },
          ),
          SignOutButton(
            onPressed: () {
              new AuthService().signOut();
            },
          )
        ],
      ),
    );
  }
}
