import 'package:flutter/material.dart';
import 'settings_button.dart';

class AccountInfoButton extends StatelessWidget {
  final void Function() onPressed;
  AccountInfoButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Hero(
        tag: 'account-info',
        child: SettingsButton(
          title: 'Account Info',
          backgroundColor: Colors.blueAccent,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
