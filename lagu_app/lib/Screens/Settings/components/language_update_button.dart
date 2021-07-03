import 'package:flutter/material.dart';
import 'package:lagu_app/Models/language.dart';
import 'settings_button.dart';

class LanguageUpdateButton extends StatelessWidget {
  final void Function() onPressed;
  LanguageUpdateButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Hero(
        tag: 'language-update',
        child: SettingsButton(
          title: 'Languages',
          backgroundColor: Colors.blueGrey,
          leftMargin: 80,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
