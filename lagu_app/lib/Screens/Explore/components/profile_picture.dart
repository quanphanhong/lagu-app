import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final String profilePicture;
  ProfilePicture({@required this.profilePicture});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
