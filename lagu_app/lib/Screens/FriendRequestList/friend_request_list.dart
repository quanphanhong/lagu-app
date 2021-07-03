import 'package:flutter/material.dart';
import 'package:lagu_app/Models/user.dart';
import 'package:lagu_app/Screens/FriendRequestList/components/friend_request_item.dart';

class FriendRequestList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FriendRequestListState();
}

class FriendRequestListState extends State<FriendRequestList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friend Requests'),
        centerTitle: true,
      ),
      body: FriendRequestItem(
        user: new User(nickname: 'Hello Kitty'),
      ),
    );
  }
}
