import 'package:flutter/material.dart';
import 'settings_button.dart';

class HobbyUpdateButton extends StatelessWidget {
  final void Function() onPressed;
  HobbyUpdateButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Hero(
        tag: 'hobby-update',
        child: SettingsButton(
          title: 'Hobbies',
          backgroundColor: Colors.blueGrey,
          leftMargin: 80,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
