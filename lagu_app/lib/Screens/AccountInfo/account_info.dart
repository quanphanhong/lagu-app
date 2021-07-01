import 'package:flutter/material.dart';
import 'package:lagu_app/components/cover_photo_update.dart';
import 'package:lagu_app/components/profile_picture_update.dart';
import 'package:lagu_app/components/rounded_button.dart';
import 'package:lagu_app/components/rounded_input_field.dart';

class AccountInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AccountInfoState();
}

class AccountInfoState extends State<AccountInfo> {
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
                    children: <Widget>[CoverPhotoUpdate()],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      ProfilePictureUpdate(),
                    ],
                  )
                ],
              ),
            ),
            RoundedInputField(
              hintText: 'Username',
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: 'About me',
              icon: Icons.info_sharp,
              onChanged: (value) {},
            ),
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
