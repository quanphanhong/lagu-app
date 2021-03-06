import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/auth_service.dart';
import 'package:lagu_app/Controller/user_handler.dart';
import 'package:lagu_app/Screens/Settings/components/account_info_button.dart';
import 'package:lagu_app/components/cover_photo_update.dart';
import 'package:lagu_app/components/loading_screen.dart';
import 'package:lagu_app/components/profile_picture_update.dart';
import 'package:lagu_app/components/rounded_button.dart';
import 'package:lagu_app/components/rounded_input_field.dart';

class AccountInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AccountInfoState();
}

class AccountInfoState extends State<AccountInfo> {
  ProfilePictureUpdate _profilePictureUpdate;
  CoverPhotoUpdate _coverPhotoUpdate;
  RoundedInputField _nicknameUpdate;
  RoundedInputField _aboutMeUpdate;

  String profilePicture = '';
  String coverPhoto = '';
  String nickname = '';
  String aboutMe = '';
  bool isLoading = true;
  String currentUserId = new AuthService().getCurrentUID();

  initializeWidgets() {
    _nicknameUpdate = RoundedInputField(
      hintText: 'Nickname',
      onChanged: (value) {
        nickname = value;
      },
    );
    _aboutMeUpdate = RoundedInputField(
      hintText: 'About me',
      icon: Icons.info_sharp,
      onChanged: (value) {
        aboutMe = value;
      },
    );
  }

  init() async {
    initializeWidgets();

    UserHandler.instance.getUser(currentUserId).then(
          (user) => {
            if (user == null)
              {
                setState(() => isLoading = false),
              }
            else
              {
                setState(() {
                  isLoading = false;

                  profilePicture = user.profilePicture;
                  _profilePictureUpdate = ProfilePictureUpdate(
                    profilePicture: user.profilePicture,
                    onChanged: (value) {
                      profilePicture = value;
                    },
                  );

                  coverPhoto = user.coverPhoto;
                  _coverPhotoUpdate = CoverPhotoUpdate(
                    coverPhoto: user.coverPhoto,
                    onChanged: (value) {
                      coverPhoto = value;
                    },
                  );

                  nickname = user.nickname;
                  if (_nicknameUpdate != null)
                    _nicknameUpdate.setText(user.nickname);

                  aboutMe = user.aboutMe;
                  if (_aboutMeUpdate != null)
                    _aboutMeUpdate.setText(user.aboutMe);
                })
              }
          },
        );
  }

  AccountInfoState() {
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AccountInfoButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            isLoading
                ? Expanded(child: LoadingScreen())
                : Column(
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
                        press: () async {
                          await UserHandler.instance.updateUserInfo(
                              currentUserId,
                              profilePicture,
                              coverPhoto,
                              nickname,
                              aboutMe);
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
