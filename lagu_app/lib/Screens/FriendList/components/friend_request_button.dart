import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/FriendRequestList/friend_request_list.dart';

class FriendRequestButton extends StatelessWidget {
  final BuildContext parentBuildContext;
  FriendRequestButton({@required this.parentBuildContext});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.all(10),
      child: TextButton.icon(
        onPressed: () {
          Navigator.push(parentBuildContext,
              MaterialPageRoute(builder: (context) => FriendRequestList()));
        },
        label: Text(
          'Friend Requests',
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(
          Icons.list_outlined,
          color: Colors.white,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
        ),
      ),
    );
  }
}
