import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FriendProfilePicture extends StatelessWidget {
  final DocumentSnapshot snapshot;
  FriendProfilePicture({@required this.snapshot});

  @override
  Widget build(BuildContext context) {
    Map<String, Object> data = snapshot.data();

    return Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(const Radius.circular(50.0)),
        border: Border.all(color: Colors.white, width: 3),
        image: new DecorationImage(
          fit: BoxFit.fill,
          image:
              (data['profilePicture'] != null && data['profilePicture'] != '')
                  ? new NetworkImage(
                      data['profilePicture'],
                    )
                  : new AssetImage('assets/images/default-avatar.png'),
        ),
      ),
      width: 60,
      height: 60,
    );
  }
}
