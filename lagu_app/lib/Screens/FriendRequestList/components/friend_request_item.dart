import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/user_handler.dart';
import 'package:lagu_app/components/friend_general_info_column.dart';
import 'package:lagu_app/components/friend_profile_picture.dart';

class FriendRequestItem extends StatefulWidget {
  final BuildContext parentBuildContext;
  final DocumentSnapshot snapshot;
  FriendRequestItem({
    @required this.parentBuildContext,
    @required this.snapshot,
  });

  @override
  State<StatefulWidget> createState() => FriendRequestItemState(
      snapshot: snapshot, parentBuildContext: parentBuildContext);
}

class FriendRequestItemState extends State<FriendRequestItem> {
  final BuildContext parentBuildContext;
  final DocumentSnapshot snapshot;
  FriendRequestItemState({
    @required this.parentBuildContext,
    @required this.snapshot,
  });

  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          FriendProfilePicture(profilePicture: snapshot.get('profilePicture')),
          FriendGeneralInfoColumn(
            nickname: snapshot.get('nickname'),
            aboutMe: snapshot.get('aboutMe'),
          ),
          Spacer(),
          buildAcceptButton(context)
        ],
      ),
    );
  }

  Widget buildAcceptButton(BuildContext context) {
    return !isAccepted
        ? TextButton(
            onPressed: () {
              setState(() => isAccepted = true);
              UserHandler.instance.acceptFriendRequest(peerId: snapshot.id);
            },
            child: Text('Accept'))
        : Text(
            'Accepted',
            style: TextStyle(color: Colors.grey),
          );
  }
}
