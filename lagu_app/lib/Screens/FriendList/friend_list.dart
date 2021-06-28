import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/FriendList/components/friend_info_item_list.dart';
import 'package:lagu_app/Screens/FriendList/components/friend_search_bar.dart';

class FriendList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FriendListState();
}

class FriendListState extends State<FriendList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: FriendSearchBar(),
      body: Stack(
        children: <Widget>[
          FriendItemList(),
        ],
      ),
    ));
  }
}
