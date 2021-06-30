import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/file_handler.dart';

class ProfilePictureUpdate extends StatefulWidget {
  final ValueChanged<String> onChanged;

  ProfilePictureUpdate({this.onChanged});

  @override
  State<StatefulWidget> createState() =>
      ProfilePictureState(onChanged: onChanged);
}

class ProfilePictureState extends State<ProfilePictureUpdate> {
  String profilePicture = '';
  final ValueChanged<String> onChanged;

  ProfilePictureState({this.onChanged});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Center(
        child: Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: (profilePicture != '')
                    ? NetworkImage(profilePicture)
                    : AssetImage('assets/images/default-avatar.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(80),
              border: Border.all(
                color: Colors.white,
                width: 10.0,
              )),
        ),
      ),
      onTap: () {
        FileHandler.instance.getImage().then(
            (url) => setState(() => {profilePicture = url, onChanged(url)}));
      },
    );
  }
}