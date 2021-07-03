import 'package:flutter/material.dart';

class FriendProfilePicture extends StatelessWidget {
  final String profilePicture;
  FriendProfilePicture({@required this.profilePicture});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(const Radius.circular(50.0)),
        border: Border.all(color: Colors.white, width: 3),
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: (profilePicture != null && profilePicture != '')
              ? new NetworkImage(profilePicture)
              : new AssetImage('assets/images/default-avatar.png'),
        ),
      ),
      width: 60,
      height: 60,
    );
  }
}
