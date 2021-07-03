import 'package:flutter/material.dart';
import 'package:lagu_app/Models/user.dart';

class FriendRequestItem extends StatefulWidget {
  final User user;
  FriendRequestItem({@required this.user});

  @override
  State<StatefulWidget> createState() => FriendRequestItemState(user: user);
}

class FriendRequestItemState extends State<FriendRequestItem> {
  final User user;
  FriendRequestItemState({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
