import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/user_handler.dart';
import 'package:lagu_app/components/cover_photo_update.dart';
import 'package:lagu_app/components/profile_picture_update.dart';
import 'package:lagu_app/components/rounded_button.dart';
import 'package:lagu_app/components/rounded_input_field.dart';

class AccountInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AccountInfoState();
}

class AccountInfoState extends State<AccountInfo> {
  final ProfilePictureUpdate _profilePictureUpdate = ProfilePictureUpdate(
    onChanged: (value) {},
  );
  final CoverPhotoUpdate _coverPhotoUpdate = CoverPhotoUpdate(
    onChanged: (value) {},
  );
  final RoundedInputField _nicknameUpdate = RoundedInputField(
    hintText: 'Nickname',
    onChanged: (value) {},
  );
  final RoundedInputField _aboutMeUpdate = RoundedInputField(
    hintText: 'About me',
    icon: Icons.info_sharp,
    onChanged: (value) {},
  );

  String profilePicture = '';
  String coverPhoto = '';
  String nickname = '';
  String aboutMe = '';

  AccountInfoState() {
    UserHandler.instance
        .getUser('L8X3zaClVBgLAaQaCSwTcTQE6vz1')
        .then((user) => {
              setState(() {
                profilePicture = user.profilePicture;
                _profilePictureUpdate.setProfilePicture(user.profilePicture);

                coverPhoto = user.coverPhoto;
                _coverPhotoUpdate.setCoverPhoto(user.coverPhoto);

                nickname = user.nickname;
                _nicknameUpdate.setText(user.nickname);

                aboutMe = user.aboutMe;
                _aboutMeUpdate.setText(user.aboutMe);
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Info'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              child: Stack(
                fit: StackFit.expand,
                // ignore: deprecated_member_use
                overflow: Overflow.visible,
                children: <Widget>[
                  Column(
                    children: <Widget>[_coverPhotoUpdate],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      _profilePictureUpdate,
                    ],
                  )
                ],
              ),
            ),
            _nicknameUpdate,
            _aboutMeUpdate,
            RoundedButton(
              text: 'Done',
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}
