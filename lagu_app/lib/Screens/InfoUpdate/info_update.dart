import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/InfoUpdate/components/profile_picture_update.dart';
import 'package:lagu_app/components/rounded_input_field.dart';
import 'package:lagu_app/const.dart';

class InfoUpdate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Your Info'),
      ),
      body: Column(
        children: <Widget>[
          ProfilePictureUpdate(),
          RoundedInputField(
            hintText: 'Nickname',
            icon: Icons.supervised_user_circle,
          ),
          RoundedInputField(
            hintText: 'About me',
            icon: Icons.info,
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.done,
              color: Colors.white,
            ),
            label: Text(
              'Done',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(themeColor),
                elevation: MaterialStateProperty.all(5.0)),
          )
        ],
      ),
    );
  }
}
