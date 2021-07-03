import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/FriendList/components/friend_info_item_list.dart';
import 'package:lagu_app/Screens/FriendList/components/friend_request_button.dart';

class FriendList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FriendListState();
}

class FriendListState extends State<FriendList> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friend List'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          FriendRequestButton(parentBuildContext: context),
          Expanded(
            child: FriendItemList(),
          )
        ],
      ),
    );
  }
}
