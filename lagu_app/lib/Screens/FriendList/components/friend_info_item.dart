import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/FriendList/components/message_button.dart';
import 'package:lagu_app/Screens/UserDetail/user-detail.dart';
import 'package:lagu_app/components/friend_general_info_column.dart';
import 'package:lagu_app/components/friend_profile_picture.dart';

class FriendInfoItem extends StatelessWidget {
  final DocumentSnapshot snapshot;
  final BuildContext parentBuildContext;
  FriendInfoItem({@required this.snapshot, @required this.parentBuildContext});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 245, 247, 255),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(vertical: 1),
        child: Row(
          children: <Widget>[
            FriendProfilePicture(snapshot: snapshot),
            FriendGeneralInfoColumn(snapshot: snapshot),
            MessageButton(
              parentBuildContext: parentBuildContext,
              userId: snapshot.id,
            )
          ],
        ),
      ),
      onTap: () async {
        Navigator.push(
            parentBuildContext,
            MaterialPageRoute(
                builder: (context) => UserDetailScreen(userId: snapshot.id)));
      },
    );
  }
}
