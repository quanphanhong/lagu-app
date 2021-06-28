import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/user_handler.dart';
import 'package:lagu_app/Screens/InfoUpdate/components/cover_photo_update.dart';
import 'package:lagu_app/Screens/InfoUpdate/components/profile_picture_update.dart';
import 'package:lagu_app/components/rounded_input_field.dart';
import 'package:lagu_app/const.dart';

class InfoUpdate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InfoUpdateState();
}

class InfoUpdateState extends State<InfoUpdate> {
  String profileUrl = '';
  String nickname = '';
  String aboutMe = '';
  String coverPhoto = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Your Info'),
      ),
      body: Column(
        children: <Widget>[
          ProfilePictureUpdate(
            onChanged: (value) {
              setState(() => profileUrl = value);
            },
          ),
          RoundedInputField(
            hintText: 'Nickname',
            icon: Icons.supervised_user_circle,
            onChanged: (value) {
              setState(() => nickname = value);
            },
          ),
          RoundedInputField(
            hintText: 'About me',
            icon: Icons.info,
            onChanged: (value) {
              setState(() => aboutMe = value);
            },
          ),
          CoverPhotoUpdate(
            onChanged: (value) {
              setState(() => coverPhoto = value);
            },
          ),
          TextButton.icon(
            onPressed: () async {
              await UserHandler.instance
                  .addAdditionalInfo(profileUrl, coverPhoto, nickname, aboutMe)
                  .then((value) => {print('Done')});
            },
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
