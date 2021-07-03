import 'package:flutter/material.dart';
import 'settings_button.dart';

class SignOutButton extends StatelessWidget {
  final void Function() onPressed;
  SignOutButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: SettingsButton(
        title: 'Sign out',
        backgroundColor: Colors.redAccent,
        onPressed: onPressed,
      ),
    );
  }
}
